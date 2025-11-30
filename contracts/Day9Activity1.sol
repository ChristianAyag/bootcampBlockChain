// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract contractCaller{
    function callCalculate(address contractAddress, uint256 num1, uint256 num2) external view returns(uint256 numSum,uint256 numDiff,uint256 numProd,uint256 numQuo){
        (bool success, bytes memory data) = contractAddress.staticcall(
            abi.encodeWithSignature("Calculate(uint256,uint256)", num1, num2)
        );

        require(success,"Call Failed");

        (numSum, numDiff, numProd, numQuo) = abi.decode(data, (uint256, uint256, uint256, uint256));
    }
}

contract contractCalculator{
    function Calculate(uint256 enterNum1, uint256 enterNum2) external pure returns (uint256 numSum,uint256 numDiff,uint256 numProd,uint256 numQuo){
        numSum = enterNum1 + enterNum2;
        numDiff = enterNum1 - enterNum2;  
        numProd = enterNum1 * enterNum2;
        numQuo = enterNum1 / enterNum2;
    }
}