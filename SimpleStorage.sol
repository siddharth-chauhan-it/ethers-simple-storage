//SPDX-License-Identifier: MIT

// pragma solidity 0.8.7;           // Only 0.8.7
// pragma solidity ^0.8.0;          // Above 0.8.0
// pragma solidity >=0.8.0 <0.9.0;  // Between 0.8.0 and 0.9.0

pragma solidity 0.8.7;

contract SimpleStorage {
  uint256 favoriteNumber;

  mapping(string => uint256) public nameToFavoriteNumber;

  struct People {
    uint256 favoriteNumber;
    string name;
  }

  // uint256[] public favoriteNumbersList;
  People[] public people;

  function store(uint256 _favoriteNumber) public virtual {
    favoriteNumber = _favoriteNumber;
  }

  function retrieve() public view returns (uint256) {
    return favoriteNumber;
  }

  function addPerson(string memory _name, uint256 _favoriteNumber) public {
    people.push(People(_favoriteNumber, _name));
    nameToFavoriteNumber[_name] = _favoriteNumber;
  }
}
