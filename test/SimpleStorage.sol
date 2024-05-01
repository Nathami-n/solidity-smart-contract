//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 myNumber;
  
    People[] public people;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
    }
    function store (uint256 number) public {
        myNumber = number;
    }
}