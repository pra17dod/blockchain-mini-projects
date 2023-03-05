//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleMapping {
    
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddress;

    mapping(uint => mapping(uint => bool)) public myUintUintBoolMapping;

    function setValue (uint _index) public {
        myMapping[_index] = true;
    }

    function setAddressToTrue () public {
        myAddress[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1, uint _key2, bool value) public {
        myUintUintBoolMapping[_key1][_key2] = value;
    }

}