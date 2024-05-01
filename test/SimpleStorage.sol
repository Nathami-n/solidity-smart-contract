//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 number;

    function assignNumber (uint256 _number) public {
        number = _number;
    }
}