(async () => {
    var Web3 = require('web3');
    const web3 = new Web3(window.ethereum);
    const acc = await web3.eth.requestAccounts()
    console.log("Accounts: ", acc)
    console.log("Accounts 1:", acc[0])
})()
