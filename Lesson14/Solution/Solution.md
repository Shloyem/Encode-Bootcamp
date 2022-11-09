## Oracle contract:

1. getRandomNumber() is external: an intermediary contract can call this function, and get the winning "guess" for Lottery.makeAGuess.

2. seed is not actually private:

- Seed shows in input data: Seed was passed as an argument to the constructor. Scanning the contract creation transaction, or changeSeed, will show the value.
- Private fields in solidity are not actually private. Looking for the first storage slot value will reveal it even if private.

3. A random number should never depend on block number, like happens in getRandomNumber().

## Lottery contract:

1. There a reentrency attack vector available in payoutWinningTeam:

```
    // once the lottery has finished pay out the best teams
    function payoutWinningTeam(address _team) external returns (bool) {
    ....
		....
          (bool sent, ) = _team.call.value(2_000_000_000)("");
          if (sent) {
              teamDetails[ii].points = 0;
```

This is incorrect because:

- Does not follow the Checks-effects-interactions pattern: By calling external functions last, even if an attacker makes a recursive call to the original function they cannot abuse the state of the contract.
- Should use ReentrancyGuard and add nonReentrant modifier to prevent recursive reentry.

2. OracleAddress is passed in the constructor - so because the getRandomNumber() doesn't provide a random number but an equal number for two calls during one transaction,
   an exploiter can find the address and set an intermediary contract to call it and get the winning number.

3. There is an underflow in line:

```
function makeAGuess(address _team, uint256 _guess) external returns (bool) {
......
teamDetails[i].points -= 1;
```

So making 1 mistake will rewards the team with 0 - 1 = uint256 MAX_UINT.

4. Because #2 grants 100 points and #3 gives MAX UINT, team made other teams guess correctly using #1 so they will have 100 and not MAX_UINT.

5. No restricting access for reset the lottery, no onlyAdmins modifier.

6. seed is not used
