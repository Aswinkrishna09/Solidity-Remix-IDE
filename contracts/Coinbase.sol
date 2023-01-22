// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Coinbase{
    function examples() public pure returns(address){
        //return block.coinbase;
        return address(2);
    }
    function time() public returns(uint){
        //return block.coinbase;
        return block.timestamp;
    }
}