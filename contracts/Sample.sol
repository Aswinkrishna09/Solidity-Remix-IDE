// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Sample{
    string public message;
    address owner;
    constructor(){
        owner = msg.sender;
    }
    modifier OnlyOwner(){
        require(msg.sender == owner, "Only Owner can change");
        _;
    }
    function setMsg(string memory _message) OnlyOwner public{
        message= _message;
    }
}
