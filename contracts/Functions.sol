// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifiers{
    bool public paused;
    uint public count;

    function setPause(bool _paused) external{
        paused = _paused;
    } 

    modifier CheckPaused(){
        require(!paused,"App is paused");
        _;
    }

    modifier CheckCountZero(){
        require(count>0,"Count is zero");
        _;
    }

    modifier cap(uint _x){
        require(_x<=100,"X Should Not Greater than 100");
        _;
    }

    modifier sy
    andwich(uint _x){
        count +=10;
        _;
        count *=2;
    }

    function inc() external CheckPaused {
        count += 1;
    }

    function dec() external CheckPaused CheckCountZero{
        count -= 1;
    }

    function addByValue(uint x) external CheckPaused cap(x){
        count +=x;
    }

    function foo(uint x) external CheckPaused cap(x) sandwich(x) {
        count +=x;
    }
}