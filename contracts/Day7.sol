// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SimpleLogger{
    event ActionPerformed(address user, string action);
        
    function logAction(string memory _action) external  {
        emit ActionPerformed(msg.sender, _action);
    }
}

contract VotingTracker{
    event VoteCasted(address indexed voter, uint proposalId, bool choice);

    function vote(uint _proposalId, bool _choice) external {
        emit VoteCasted(msg.sender, _proposalId, _choice);
    }
}