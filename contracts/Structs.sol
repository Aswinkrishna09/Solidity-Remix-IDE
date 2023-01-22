// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Structs{
    struct Car{
        string model;
        uint year;
        address owner;
    }
    Car public car; // state variable
    Car[] public cars; // state variable - array
    mapping(address=>Car[]) public carsByowner;

    function examples() external{
        Car memory toyota = Car("Toyota",1990,msg.sender);
        Car memory lambo = Car({model:"Lamborghini",owner:msg.sender,year:2010});
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.owner = msg.sender;
        tesla.year = 2012;
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        cars.push(Car("Ferrari",2022,msg.sender));
        Car storage _car = cars[0];
        _car.model = "Tata";
        delete _car.year; //delete is a unary operator
        delete cars[1];
    }
}