// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract PayableTransfers{

    mapping (address => uint) public balances;

    event Deposited(address indexed sender, uint amount);
    event Withdrawn(address indexed reciepient, uint amount);
    event Sent(address indexed to, uint amount, bool success);

    function deposit() external payable {
        require(msg.value > 0, "Must send some ETH");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }
    
    
    receive() external payable  {
        require(msg.value > 0, "Must send some ETH");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }
    
    fallback() external payable { 
        require(msg.value > 0, "Must send some ETH");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function widthraw (uint amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Withdraw failed");

        emit Withdrawn(msg.sender, amount);
    }

    function widthrawViaTransfer(uint amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        //(bool success, ) = payable(msg.sender).call{value: amount}("");
        payable(msg.sender).transfer(amount);
        //require(success, "Withdraw failed");

        emit Withdrawn(msg.sender, amount);
    }

    function widthrawViaSend(uint amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance");
        balances[msg.sender] -= amount;
        bool success = payable(msg.sender).send(amount);
        //payable(msg.sender).transfer(amount);
        require(success, "Withdraw failed");

        emit Withdrawn(msg.sender, amount);
    }
}