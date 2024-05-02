//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 myNumber;

    mapping(string => uint256) public nameToFavoriteNumber;
  
    People[] public people;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    function store (uint256 number) public {
        myNumber = number;
    }
}

contract FundMe {

    uint256 public minUsd = 50;
    function fund() public payable {
        //set a minimum fund amount in usd
        require(msg.value >= minUsd, "Error not enough funds");
    }
    
    function getPrice() public view returns(uint256) {

        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer,,,) =  priceFeed.latestRoundData();
        return uint256(answer * 1e10);

    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }
    //function withdraw(){}
}