//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract WalletSmartContract {

    function getBalance () public view returns (uint){
        return address(this).balance;
    }

    function deposit () public payable {}

    function withdrawAll () public {
        payable(msg.sender).transfer(address(this).balance);
    }

    function withdrawTo (address _toAddress) public {
        payable(_toAddress).transfer(address(this).balance);
    } 

}
