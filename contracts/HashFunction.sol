// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HashFunction {
    function hash(string memory _text, uint256 _num)
        public
        view
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(_text, _num, msg.sender));
    }

    function collision(uint _str1, uint _str2)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encodePacked(_str1, _str2));
        // to avoid collision use abi.encode(_str1, _str2)
    }
}

contract GuessTheMagicWord {
    bytes32 public answer =
        0x0a526a417ba2bff90b3020d4ca5ebd29ea7c036763e6c5ef1a489b7c958b7fba;

    function guess(string memory _text) public view returns (bool) {
        return keccak256(abi.encodePacked(_text)) == answer;
    }
}
