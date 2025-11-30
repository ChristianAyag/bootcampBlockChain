// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FirstContract {
    function firstFunction() public pure returns (string memory) {
        return "First function";
    }
    
    function secondFunction() public pure returns (string memory) {
        return "Second Function";
    }
}

contract SecondContract {
    function thirdFunction() public pure returns (string memory) {
        return "Third function";
    }
}

contract ThirdContract is FirstContract, SecondContract {
}