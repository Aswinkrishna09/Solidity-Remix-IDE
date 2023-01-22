// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Data locations - storage, memory and calldata

contract DataLocations {
    struct MyStruct {
        uint256 foo;
        string text;
    }
    mapping(address => MyStruct) public myStructs;

    function examples(uint[] calldata x)
        external
        returns (MyStruct memory)
    {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "abc"});
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";
        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456;
        _internal(x);
        // call data is a potential to save gas
        // data type declared as calldata will not be modifiable. 
        //it can change when u pass it to another function
        return readOnly;
    }

    function _internal(uint[] calldata y) private{
        uint x = y[0];
    }
    function change(uint[] calldata _x) pure external returns(uint[] calldata){
       // uint[] memory x = new uint[](_x.length);
        _x[_x.length-1] = 2;
        return _x;
    }
}
