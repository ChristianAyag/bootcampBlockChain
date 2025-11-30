// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract CurrencyConverter {
    AggregatorV3Interface internal priceFeed;

    constructor() {
        priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

    // #1: Convert dollar amount to ETH amount
    function convertDollarToEth(uint256 dollarAmount) public view returns (uint256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        uint256 ethPrice = uint256(price); // Price in USD with 8 decimals
        return (dollarAmount * 1e26) / ethPrice;
    }

    // #2: Fetch the price of ETH to peso
    function getEthToPesoPrice() public view returns (uint256) {
        (, int256 price, , , ) = priceFeed.latestRoundData();
        uint256 ethUsdPrice = uint256(price) / 1e8; // Convert to actual USD value
        uint256 phpPerUsd = 56; // PHP to USD conversion rate
        return ethUsdPrice * phpPerUsd;
    }
}