// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Wallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Caller is not owner");
        payable(msg.sender).transfer(amount);
    }
}
