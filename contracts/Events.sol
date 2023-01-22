// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Events {
    uint256 number;
    event StoredNumber(
        uint256 indexed oldNumber,
        uint256 indexed newNumber,
        uint256 addedNumber,
        address sender
    );

    function store(uint256 _number) public {
        emit StoredNumber(number, _number, number + _number, msg.sender);
        number = _number;
    }

    function retrieve() public view returns (uint256) {
        return number;
    }
}
