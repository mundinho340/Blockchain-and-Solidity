//Voting

//Now that we have proposals with vote counts, it's time to create voting functionality!
//Your Goal: Cast Vote

  //  Create an external function castVote which takes a uint proposalId and a bool which indicates whether the vote supports the proposal (true for yes, false for no).
  //  For each vote cast, update the yesCount and noCount in the referenced proposal accordingly.

//    Don't worry about double votes for the moment, we'll get to that in the next stage!


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal [] public proposals;
    Proposal public proposal;

    function newProposal(address _address, bytes memory _value) external {
       proposal= Proposal({
           target:_address,
            data:_value,
            yesCount:0,
            noCount:0
       }) ;
       proposals.push(proposal);
    }

    function castVote(uint proposall, bool vote) external{
        if(vote == true){
            proposals[proposall].yesCount++;
        }else{
            proposals[proposall].noCount++;
        }
    }
    
}
