// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Act1Day6{

    uint[3] public numbers = [1,2,3];

    function setValue(uint index, uint value) external {
        require(index < numbers.length, "Index out of bounds");
        numbers[index] = value;
    }

    function getValue(uint index) external view returns (uint) {
        require(index < numbers.length, "Index out of bounds");
        return numbers[index];
    }
}

contract Act2Day6{

    uint[] public scores;

    function addScore(uint count) external {
        scores.push(count);
    }

    function removeScore() external {
        scores.pop();
    }

    function getScore(uint index) external view returns (uint) {
        require(index < scores.length, "Index out of bounds");
        return scores[index];
    }

    function totalScores() external view returns (uint){
        return scores.length;
    }
}

contract Act3Day6{
    mapping (address => uint) public balances;

    function deposit(uint amount) external returns (string memory){
        require(amount > 0, "Please input an amount");
        balances[msg.sender] += amount;
        return "Deposit Success!";
    }

    function getBalance(address user) external view returns (uint){
        return balances[user];
    }

    function resetMyBalance() external {
        balances[msg.sender] = 0;
    }
}

contract Act4Day6{
    struct Student{
        string studentName;
        uint age;
        bool enrolled;
    }

    Student[] public students;

    function addStudent(string memory _studentName, uint _age, bool _enrolled) external {
        students.push(
            Student({
                studentName: _studentName,
                age: _age,
                enrolled: _enrolled
            })
        );
    }

    function getStudent(uint index) external view returns (string memory, uint, bool) {
        return (
            students[index].studentName,
            students[index].age,
            students[index].enrolled
        );
    }

    function getStudentTotal() external view returns (uint){
        return students.length;
    }
}