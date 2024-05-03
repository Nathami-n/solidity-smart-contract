// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//get funds from users
// withdraw funds
//set minimum value in USD

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    address immutable sender;

    uint256 public minUsd = 50 * 1e18;

    constructor() {
        sender = msg.sender;
    }

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    function fund() public payable {
        //set a minimum fund amount in usd
        require(msg.value.getConversionRate() >= minUsd, "Error not enough funds");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw () public checkUser {
        for(uint256 add = 0; add < funders.length; add ++){
            address funderAdress = funders[add];
            addressToAmountFunded[funderAdress] = 0;
        }
         funders = new address[](0);

        //fund the user 
        (bool success, ) = payable(msg.sender).call{value: address(this).balance}('');
        require(success, "failed");
    }
   

   modifier checkUser {
    if(msg.sender != sender) {
        revert("Not allowed");
    }
    _;

   }
    
}