//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMappingStruct {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBal;
        uint numDeposits;
        uint numWithdrawals;
        mapping (uint => Transaction) deposits;
        mapping (uint => Transaction) withdrawals;

    }

    mapping(address => Balance) public balances;

    function getDepositDetail (address _from, uint _depositNum) public view returns(Transaction memory) {
        return balances[_from].deposits[_depositNum];
    }

    function getWithdrawalDetail (address _from, uint _depositNum) public view returns(Transaction memory) {
        return balances[_from].deposits[_depositNum];
    }

    function depositMoney() public payable {
        balances[msg.sender].totalBal += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].numDeposits++;
    }

    function withdrawMoney(uint _amount) public payable {
        balances[msg.sender].totalBal -= _amount;

        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;
        balances[msg.sender].numWithdrawals++;
    }

}