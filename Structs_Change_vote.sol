//Your Goal: Change Vote

    //Create an external function called changeVote which takes a Choices argument and changes the choice on the existing vote for the msg.sender.
  //  If they do not have an existing vote, revert the call.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }
    
    struct Vote {
        Choices choice;
        address voter;
    }
    
    // Array de votos
    Vote[] public votes;
    
    // Mapeamento para verificar se o endereço já votou
    mapping(address => bool) public hasVotedMapping;
    
    // Função para criar um voto
    function createVote(Choices choice) external {
        // Se o endereço já tiver votado, revert a transação
        if (hasVotedMapping[msg.sender]) {
            revert("Hey voce ja votou boy");
        }

        // Adiciona o voto e marca que o endereço já votou
        votes.push(Vote(choice, msg.sender));
        hasVotedMapping[msg.sender] = true;
    }

    // Função para verificar se o endereço já votou
    function hasVoted(address _address) public view returns (bool) {
        return hasVotedMapping[_address];
    }

    // Função para encontrar a escolha de um endereço
    function findChoice(address _address) public view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (_address == votes[i].voter) {
                return votes[i].choice;
            }
        }
        revert("Voter not found");
    }
    function changeVote(Choices _choice) external  {
        if(!hasVotedMapping[msg.sender]){
             revert("Edjo voce ja votou");
        }
        
        for(uint i =0; i< votes.length; i++){
            if(votes[i].voter == msg.sender){
                votes[i].choice = _choice;
                return;
            }
        }

        revert("Ocorreu um erro ao alterar o voto");
       
    }
}
