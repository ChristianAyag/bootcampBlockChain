// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Conversion{

    function celsiusConvert(uint cels) public pure returns (uint){
        return (cels * 9/5) + 32;
    }

    function timeConvert(uint hour) public pure returns (uint){
        return hour * 3600;
    }

    function averageOfThree(uint inputOne, uint inputTwo, uint inputThree) public pure returns (uint){
        return inputOne + inputTwo + inputThree / 3;
    }

    function moneyConversion(uint eth) public pure returns (uint){
        return eth * 2810;
    }
}