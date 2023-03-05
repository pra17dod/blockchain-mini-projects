//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Sender {

    receive() external payable {}

    function transferMoney (address payable _to) public {
        _to.transfer(10);
    } 

    function sendMoney (address payable _to) public {
        bool success = _to.send(10);
        require (success, "Insufficient gas balance!");
    }

}

contract ReceiverNoAction {

    receive() external payable {}

}

contract ReceiverAction {

    uint balReceived;

    receive() external payable {
        balReceived += msg.value;
    }

}