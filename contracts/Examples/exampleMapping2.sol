//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract BalanceWithdrawalByDepositer {

    mapping(address => uint) public balReceived;

    function deposit () public payable {
        balReceived[msg.sender] += msg.value;
    }

    function withdrawAll () public {
        uint balToSend = balReceived[msg.sender];
        balReceived[msg.sender] = 0;
        payable(msg.sender).transfer(balToSend);
    }

    function getBalance () public view returns(uint) {
        return address(this).balance;
    }

}