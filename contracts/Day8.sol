// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract EthBank{

    mapping (address => uint) public balances;

    event Deposited(address indexed sender, uint amount);
    event Withdrawn(address indexed reciepient, uint amount);

    function deposit() external payable {
        require(msg.value > 0, "Input some ETH to proceed with the transaction!");
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function checkBalance() public view returns (uint){
        return balances[msg.sender];
    }

    function widthraw(uint amount) external {
        require(balances[msg.sender] >= amount, "Not enough balance!");
        balances[msg.sender] -= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Withdraw failed");
        emit Withdrawn(msg.sender, amount);
    }
}