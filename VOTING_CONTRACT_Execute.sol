//Execute Vote

//In smart contract governance systems there is usually some minimum voting participation that must be reached before a proposal can be executed. Most governance systems today use coin voting, where the number of voting ERC20 tokens you hold decide your vote weight.
//Your Goal: Execute

//Let's make our minimum voting threshold be 10 participants. Once 10 members have voted yes on a proposal, execute it.

   // Update the castVote function to execute the proposal when the 10 yes votes have been registered.
   // Execute the vote by sending the data to the target address using the call syntax.

  //  You should make sure that the proposal has not already been executed.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    Proposal [] public proposals;
    Proposal public proposal;
    mapping(address => uint) public voters;
    mapping (address => bool) public authorized;
    event ProposalCreated(uint proposalID);
    event VoteCast(uint proposalId, address _address);
    event proposalExecuted(uint id);

    modifier onlyAuthorized(){
        require(authorized[msg.sender], "Not authorized");
        _;
    }


    modifier proposalExists(uint proposalID){
        require(proposalID<proposals.length, "Invalid proposals");
        _;
    }

    // modifier notExecuted(uint proposalID){
    //     require(!proposals[proposalID].executed, "proposal alredy executed");
    //     _;
    // }
    constructor (address[] memory initialAuthorized)  {
        authorized[msg.sender] = true;
        for(uint i=0; i< initialAuthorized.length; i++){
            authorized[initialAuthorized[i]]= true;
        }
    }


    function newProposal(address _address, bytes memory _value) external onlyAuthorized {
       proposal= Proposal({
           target:_address,
            data:_value,
            yesCount:0,
            noCount:0,
            executed: false
       }) ;
       proposals.push(proposal);
       emit ProposalCreated(proposals.length-1);

    }

    function castVote(uint proposall, bool vote) external onlyAuthorized proposalExists(proposall) 
         {
        
        if (authorized[msg.sender] && !proposals[proposall].executed){
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
                    if(proposals[proposall].yesCount < 10){

                        if(vote == true){
                            proposals[proposall].yesCount++;
                            voters[msg.sender] = 1;
                        }else{
                            proposals[proposall].noCount++;
                            voters[msg.sender] = 2;
                        }
                    }
                }
                emit VoteCast(proposall, msg.sender);
            }else{
                revert("Nao tens permissao para fazer esta operacao");
            }
            if(proposals[proposall].yesCount>=10 && !proposal.executed){
                    executedProposal(proposall);
            }
    }

    function executedProposal(uint proposalID) internal{
        proposal = proposals[proposalID];

        proposal.executed =true;
        (bool sucess, )=proposal.target.call(proposal.data);
        require(sucess, "proposal execution fail");
        emit proposalExecuted(proposalID);
    }

    
}

