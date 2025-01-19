//Voting Members

//It's important for us to maintain a list of voting members.

//After all, it's relatively easy for anyone to make hundreds of Ethereum addresses very quickly and vote with each of these addresses. The only thing stopping them is gas and effort!

  //  When a single person operates many accounts it is known as a Sybil attack. Any system that is setup to handle this is known to be sybil resistant.

//Your Goal: Members

  //  Create a public constructor which takes an array of address. These addresses, plus the deployer of the function, should all be allowed to create new proposals and vote on those proposals.
  //  If anyone else attempts to create a proposal or vote, the call should be reverted.

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
    mapping (address => bool) public authorized;
    event ProposalCreated(uint proposalID);
    event VoteCast(uint proposalId, address _address);

    modifier onlyAuthorized(){
        require(authorized[msg.sender], "Not authorized");
        _;
    }
    constructor (address[] memory initialAuthorized)  {
        authorized[msg.sender] = true;
        for(uint i=0; i< initialAuthorized.length; i++){
            authorized[initialAuthorized[i]]= true;
        }
    }


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
     if (authorized[msg.sender]){
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
        }else{
            revert("Nao tens permissao para fazer esta operacao");
        }
    }
    
}

