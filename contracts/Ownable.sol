// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier OnlyOwner() {
        require(msg.sender == owner, "Unauthorized user");
        _;
    }

    function setOwner(address _owner) public OnlyOwner {
        require(_owner != address(0), "Invalid Address");
        owner = _owner;
    }
}
