// SPDX-License-Identifier: None
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin is Ownable {
    struct Payment {
        uint amount;
        address recipient;
    }

    // address owner;           // Removed because of Ownable
    uint public totalSupply = 10000;
    mapping(address => uint) public balances;
    mapping(address => Payment[]) public payments;

    event SupplyChanged(uint newAmount);
    event Transfer(uint amount, address recipient);

    // modifier onlyOwner {     // Removed because of Ownable
    //     require(msg.sender == owner);
    //     _;
    // }

    constructor() {
        // owner = msg.sender;  // Removed because of Ownable
        balances[owner()] = totalSupply; // owner turned into owner() from Ownable
    }

    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply += 1000;
        emit SupplyChanged(totalSupply);
    }

    function transfer(uint amount, address recipient) public {
        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(amount, recipient);

        payments[msg.sender].push(Payment(amount, recipient));
    }
}
