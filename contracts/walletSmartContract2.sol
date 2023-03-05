//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;


contract Wallet {
    
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    uint public allowance = 10;

    function deposit() public payable {}

    function spendFunds(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){
        require (msg.sender == owner, "You are not the owner!"); 
        // bool success = _to.send(_amount);
        
        (bool success, bytes memory returnData) = _to.call{value: _amount, gas: 100000}(_payload);
        require (success, "Call unsuccessful!");
        return returnData;

    } 

    function giveAllowance(address payable _to) public {
        require (msg.sender == owner, "You are not the owner!");
        spendFunds(_to, allowance, "");
    }

    mapping (address => bool) public gaurdians;

    function addGuardian (address _address) public {
        require (msg.sender == owner);
        gaurdians[_address] = true;
    }

    function newOwner () public {
        require(gaurdians[msg.sender], "You are not a gaurdian!");
        owner = payable(msg.sender);
    }

}


contract SomeContract {
    receive() external payable {}

}