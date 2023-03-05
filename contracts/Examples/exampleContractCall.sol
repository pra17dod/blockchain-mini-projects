//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;


contract ContractOne {

    mapping (address => uint) balances;
    
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
    }

}


contract ContractTwo {

    function deposit() public payable {}

    // function depositOnContractOne(address _contractOne) public { 
    //     ContractOne one = ContractOne(_contractOne);
    //     one.deposit{value: 10, gas: 100000}(); 
    // }

    function depositOnContractOneByLowLevelCall1(address _contractOne) public { 
        bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}(payload);
        require(success);
    }

    function depositOnContractOneByLowLevelCall2(address _contractOne) public { 
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }

}