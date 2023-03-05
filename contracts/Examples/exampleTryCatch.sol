//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleTryCatch {

    error NotAllowed(string);

    function catchError() public pure {
        // require(false, "Error message!");
        // assert(false);
        revert NotAllowed("Method Not Allowed");
    }

}

contract ErrorHandling {

    event ErrorLogging(string reason);
    event ErrorCode(uint errorCode);
    event CustomError(bytes message);

    function execute() public {
        ExampleTryCatch sample = new ExampleTryCatch();
        try sample.catchError() {
            // do something
        }
        catch Error(string memory reason) {
            emit ErrorLogging(reason);
        } 
        catch Panic(uint errorCode) {
            emit ErrorCode (errorCode);
        }
        catch (bytes memory message) {
            emit CustomError(message);
        }
    }

}