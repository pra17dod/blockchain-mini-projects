//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleContract {
    string public myString = "Hello World";

    function updateString (string memory _string) public payable {
        if (msg.value >= 1 ether) {
            payable(msg.sender).transfer(msg.value - 1 ether);
            myString = _string;
        }
        else {
            payable(msg.sender).transfer(msg.value);
        }
        
    }
}