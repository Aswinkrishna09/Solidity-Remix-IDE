// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Statement {
    string[] str_arr = ["even", "odd"];

    function example(uint256 _x) public view returns (string memory) {
        if (_x % 2 == 0) {
            return str_arr[0];
        }
        return str_arr[1];
    }
}

contract Loops {
    mapping(address => uint[][]) public key_val_pairs;

    function loop(uint256 x) public pure returns (uint256[] memory) {
        uint256[] memory NewArray = new uint256[](x);
        for (uint256 i = 0; i < x; i++) {
            NewArray[i] = i + 1;
        }
        return NewArray;
    }

    function findOdd(uint256 x) public pure returns(uint[] memory) {
        uint256 evenCounter;
        uint256 oddCounter;
       // uint256[] memory a = new uint256[](2);
        for (uint256 i = 1; i <= x; i++) {
            i % 2 == 0 ? evenCounter++ : oddCounter++;
        }
        uint[] memory evenArray = new uint[](evenCounter);
        uint[] memory oddArray = new uint[](oddCounter);
        for (uint i = 1; i <= x; i++) {
            i % 2 == 0 ? evenArray[i]=i: oddArray[i]=i;
        }
        return evenArray;
    }
}
