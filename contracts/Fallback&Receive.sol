// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract FallBackReceive {
    event Log(string funcType, address sender, uint256 value, bytes data);

    // fallback() external payable {
    //     emit Log("fallback", msg.sender, msg.value, msg.data);
    // }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, '');
    }
    function deposit() external payable {}
}
