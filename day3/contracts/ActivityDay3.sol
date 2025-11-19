// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract DataTypes{
    string public userName = "chrissue";
    uint256 public userScore = 17;
    uint256 public userLevel = 3;
    bool public userLife = true;
    string public status;

    function updatePlayerStatus() public {
        if(userLife) {
            status = "Player is alive";
        } else {
            status = "Player is dead";
        }
    }

    function setAlive(bool _alive) public {
        userLife = _alive;
        updatePlayerStatus();
    }
}