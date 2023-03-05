//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleMsgSender {
    address public senderAddress;

    function updateSenderAddress() public {
        senderAddress = msg.sender;
        
    }
}