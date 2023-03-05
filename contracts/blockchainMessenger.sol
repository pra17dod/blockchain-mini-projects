//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Messenger {
    address public owner;
    string public message;
    uint public updateCount;

    constructor () {
        owner = msg.sender;
    }

    function setMessage (string memory _message) public {
        if (owner == msg.sender) {
            message = _message;
            updateCount++;
        }
    }

}