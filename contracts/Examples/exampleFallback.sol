//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

//receive() is a function that gets priority over fallback() when a calldata is empty. 
//But fallback gets precedence over receive when calldata does not fit a valid function signature.

contract SampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;

    uint public myUint;

    function setMyUint (uint _myNewInt) public {
        myUint = _myNewInt;
    }

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}