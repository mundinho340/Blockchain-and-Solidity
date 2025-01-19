//Events

//We'll want to make it easy for the user interface to subscribe to new proposal and voting events!

//Let's add some new events so we can listen closely.
//Your Goal: Proposal Created & Vote Cast Events

  //  Create an event ProposalCreated which takes a single argument: a uint proposal ID. Emit this event whenever a new Proposal struct is created.
//    Create an event VoteCast which takes two arguments: a uint proposal ID and an address for the voter's address. Emit this event any time a new vote is cast.
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
    event ProposalCreated(uint proposalID);
    event VoteCast(uint proposalId, address _address);

    function newProposal(address _address, bytes memory _value) external {
       proposal= Proposal({
           target:_address,
            data:_value,
            yesCount:0,
            noCount:0
       }) ;
       proposals.push(proposal);
       emit ProposalCreated(proposals.length-1);

    }

    function castVote(uint proposall, bool vote) external{
        if(voters[msg.sender]>0){
            if(vote == false){
                if(proposals[proposall].yesCount !=0){
                    proposals[proposall].noCount +=1;
                    proposals[proposall].yesCount -=1;

                }else{
                    proposals[proposall].noCount+=1;

                }
            }else{
                if(proposals[proposall].noCount!=0){
                    proposals[proposall].noCount -=1;
                    proposals[proposall].yesCount +=1;
                }else{
                    proposals[proposall].yesCount +=1;

                }
                
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
        emit VoteCast(proposall, msg.sender);
    }

   

    
}
