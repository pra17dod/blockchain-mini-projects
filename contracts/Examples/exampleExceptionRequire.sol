//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract ExampleExceptionRequire {

    mapping (address => uint) public balReceived;

    function receiveMoney() public payable {
        balReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require (_amount <= balReceived[_to], "Not enough funds, aborting transaction!");
            balReceived[_to] -= _amount;
            _to.transfer(_amount);
    }

}