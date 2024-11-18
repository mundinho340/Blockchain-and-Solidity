// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    // Function to relay any calldata to the hero
    function relay(address hero, bytes memory data) external {
        // Send all of the data as calldata to the hero
        (bool success, ) = hero.call(data);

        require(success, "Call to hero failed");
    }
}
