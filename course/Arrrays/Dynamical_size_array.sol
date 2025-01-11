//We can also create arrays in Solidity where the size is unknown at compile-time. These arrays are said to have dynamic size.

//For example:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    function sum(uint[] calldata numbers) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        return total;
    }
}
