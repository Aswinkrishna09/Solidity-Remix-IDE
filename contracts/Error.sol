// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Errors{
    function testRequire(uint i) public pure{
        require(i<10,"I should less than 10");
    }
    function testRevert(uint i) public pure{
        if(i<10){
            revert("I should less than 10");
        }
    } 
    uint public num = 123;
    function testAssert() public view{
        assert(num==123);
    }  
    function foo(uint i) public{
        num = i;
    }

    error MyError(address sender,uint i);

    function testCustomError(uint i) public view{
        if(i<10){
            revert MyError(msg.sender,i);
        }
    }

}