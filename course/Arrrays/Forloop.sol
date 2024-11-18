// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    // External function to calculate the sum of a fixed-size array of five unsigned integers
    function sum(uint[5] calldata numbers) external pure returns (uint) {
        uint total = 0; // Variable to hold the sum
        
        // Loop through the array to calculate the total sum
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        
        return total; // Return the total sum
    }
}