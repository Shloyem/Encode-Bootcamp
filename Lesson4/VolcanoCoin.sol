// SPDX-License-Identifier: None
pragma solidity ^0.8.0;

contract VolcanoCoin {
    struct Payment {
        uint amount;
        address recipient;
    }

    address owner;
    uint public totalSupply = 10000;
    mapping(address => uint) public balances;
    mapping(address => Payment[]) public payments;

    event SupplyChanged(uint newAmount);
    event Transfer(uint amount, address recipient);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply;
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
