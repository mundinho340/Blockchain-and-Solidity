//Multiple Votes

//We need to handle the case where an address votes twice.

//One potential way to handle this is to prevent voters from voting twice. However, what if they want to change their vote?

//Let's allow voters to change their vote. Adding this functionality will require that we account for the vote change in the vote counts. 
//This means that if the address previously voted yes and switched to no, we'll want to decrement the yesCount and increment the noCount. And vice-versa!
//Your Goal: Vote Changing

   // Modify the castVote function to allow voters to change their vote on a particular proposal.

   // The implementation of this is up to you! You'll need to figure out a new way to track which addresses have already voted on which proposal.
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
    mapping(address => uint) public voters;

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
        if(voters[msg.sender]>0){
            if(vote == false){
                proposals[proposall].noCount +=1;
                proposals[proposall].yesCount -=1;
            }else{
                proposals[proposall].noCount -=1;
                proposals[proposall].yesCount +=1;
            }
        }else{
            if(vote == true){
                proposals[proposall].yesCount++;
                voters[msg.sender] = 1;
            }else{
                proposals[proposall].noCount++;
                voters[msg.sender] = 2;
            }
        }
        
    }
    
}
