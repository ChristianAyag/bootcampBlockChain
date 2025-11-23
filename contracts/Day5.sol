// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Activity5{
    function TempCheck(int cels) public pure returns (string memory){
        if (cels >= 100){
            return "BOILING POINT!";
        }
        else if(cels <= 0){
            return "FREEZING POINT!";
        }
        else {
            return "NEITHER";
        }
    }

    function GradeEval(uint score) public pure returns (string memory){
        if (score >= 90){
            return "A";
        }
        else if(score >= 80 ){
            return "B";
        }
        else if(score >= 70){
            return "C";
        }
        else {
            return "F";
        }
    }

    function SpeedTester(uint speed) public pure returns (string memory){
        if (speed >= 100){
            return "YOU'RE ON THE SPEED LIMIT!";
        }
        else {
            return "YOU'RE GOOD, KEEP GOING!";
        }
    }

    function AgeCheker(uint age) public pure returns (string memory){
        if (age < 13){
            return "You're not allowed son";
        }
        else if(age < 18){
            return "You need a guardian to access this";
        }
        else {
            return "Go ahead!";
        }
    }

    function sumCounter(uint count) public pure returns(uint){

        uint sum = 0;

        for (uint i = 1; i <= count; i++){
            sum += i;
        }

        return sum;
    }

    function evenSum(uint count) public pure returns(uint){

        uint sum = 0;

        for (uint i = 1; i <= count; i++){
            if (i % 2 == 0){
                sum += i;
            }
        }

        return sum;
    }
}