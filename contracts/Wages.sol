// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Wages{
    struct WagesRecord{
        uint date;
        uint amount;
    }

    mapping(string=>WagesRecord[]) public wagesRecord;
    function AddRecord(string memory _name,uint _amount) external {
        wagesRecord[_name].push(WagesRecord(block.timestamp,_amount));
        //wagesRecord[_name] = WagesRecord(block.timestamp,_amount);
    }

    // function getRecord(string memory _name ) external view returns(WagesRecord memory){
    //     return wagesRecord[_name];
    // }
}