// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SendETH {
    constructor() payable {}

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool send = _to.send(123);
        require(send, "Send Failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}("");
        require(success, "Call Failed");
    }
}

contract EthReceiver {
    event Log(uint256 amount, uint256 gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
