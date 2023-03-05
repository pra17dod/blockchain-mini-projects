//SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

contract ExampleExceptionAssert {

    mapping (address => uint8) public balReceived;

    function receiveMoney() public payable {
        assert (msg.value == uint8(msg.value));
        balReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require (_amount <= balReceived[_to], "Not enough funds, aborting transaction!");
            balReceived[_to] -= _amount;
            _to.transfer(_amount);
    }

}