// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappings{
    // mapping(address=>uint) public balances;
    // mapping(address=>mapping(address=>bool)) public isFriend;

    // function examples() external{
    //     balances[msg.sender] = 123;
    //     uint bal_1 = balances[msg.sender];
    //     uint bal_2 = balances[address(1)]; // return 0 because the default value of uint that given in the mapping is zero

    //     balances[msg.sender] += 456;
    //     delete balances[msg.sender]; // reset it to 0
    //     isFriend[msg.sender][address(this)] = true;
    // }

    // create a mapping logic that we can check the length of the mapping and iterate through
    mapping(address=>uint) public balances;
    mapping(address=>bool) public isInserted;
    address[] public keys;
    
// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
// 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
// 0x617F2E2fD72FD9D5503197092aC168c91465E7f2
// 0x17F6AD8Ef982297579C203069C1DbfFE4348c372
// 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678
// 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7
// 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C

    function setvalue(address _key ,uint _value) external{
        balances[_key] = _value;
        
        if(!isInserted[_key]){
            isInserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns(uint){
        return keys.length;
    }

    function getFirst() external view returns(uint){
        return balances[keys[0]];
    }

    function getLast() external view returns(uint){
        return balances[keys[keys.length-1]];
    }

    function getNth(uint _index) external view returns(uint){
        return balances[keys[_index]];
    }
}