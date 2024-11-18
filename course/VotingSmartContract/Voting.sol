// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    // Struct to represent a proposal
    struct Proposal {
        address target;          // Target address for the calldata
        bytes data;              // Calldata to be executed if proposal passes
        uint yesCount;           // Number of "yes" votes
        uint noCount;            // Number of "no" votes
    }

    // Array to store all proposals
    Proposal[] public proposals;

    // External function to create a new proposal
    function newProposal(address _target, bytes calldata _data) external {
        // Create a new proposal with the initial vote counts set to 0
        Proposal memory newProposalInstance = Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        });

        // Add the newly created proposal to the proposals array
        proposals.push(newProposalInstance);
    }

    // Optionally, you can add a function to get the number of proposals
    function getProposalCount() external view returns (uint) {
        return proposals.length;
    }
}
