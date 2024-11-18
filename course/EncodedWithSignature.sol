// replace this:
// bytes4 memory payload = abi.encodePacked(bytes4(keccak256("rumble()")));

// with this:
// bytes memory payload = abi.encodeWithSignature("rumble()");

//And if you want to add arguments, you can add them to signature and as comma separated arguments to the encodeWithSignature method. If rumble took two uint arguments, we could pass them like this:

// bytes memory payload = abi.encodeWithSignature("rumble(uint256,uint256)", 10, 5);

// (bool success, ) = hero.call(payload);

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero, uint256 enemies, bool armed) external {
        // Construct the calldata to alert the hero
        bytes memory data = abi.encodeWithSignature("alert(uint256,bool)", enemies, armed);
        
        (bool success, ) = hero.call(data);

        require(success, "Alert failed");
    }
}
