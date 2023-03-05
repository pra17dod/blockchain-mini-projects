//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {
    
    uint8 public myUint8;

    function setMyUInt (uint8 _myUint8) public {
        myUint8 = _myUint8;
    }

    function decrementUintUnchecked() public {
        unchecked {
            myUint8--;
        }
    }

    function decrementUint() public {
        myUint8--;
    }

    function increment() public {
        myUint8++;
    }

}