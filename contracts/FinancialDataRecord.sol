// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Finance {
    struct Account {
        uint256 amount;
        uint256 time;
    }

    mapping(address => Account[]) public accounts;
    mapping(address => uint256) public Money;

    event Deposit(address indexed from, uint256 indexed amount);
    event WithDrawAmount(address indexed user, uint256 indexed amount);

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function DepositMoney(uint256 _amount)
        public
        returns (address, uint256)
    {
        accounts[msg.sender].push(
            Account({amount: _amount, time: block.timestamp})
        );
        Money[msg.sender] += _amount;
        return (msg.sender, accounts[msg.sender].length - 1);
    }

    function withdraw(uint256 _amount) public {
        require(
            Money[msg.sender] >= _amount,
            "Requested amount is not available"
        );
        Money[msg.sender] -= _amount;
        emit WithDrawAmount(msg.sender, _amount);
    }
}
