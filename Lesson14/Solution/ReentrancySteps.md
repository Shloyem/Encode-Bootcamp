Reentrancy steps:
1. Have the Lottery contract deploy and initialized.
2. Deploy ReenterLottery contract with 1gwei.
3. Sign up the address of ReenterLottery contract as a team, send the 1gwei.
4. Get 100 points in Lottery contract by calling makeGuess() 6 times with a wrong guess. It will underflow Lottery and you will have MAX_UINT256 amount of points.
5. Call payWinningTeam with ReenterLottery address.