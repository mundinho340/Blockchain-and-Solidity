// Your Goal: Only Owner

//On the Collectible.sol tab you'll see that Collectible contract inherits from the Ownable contract.

 //   Your goal is to fill out the Ownable base contract, which will be used by the Collectible contract!
 //   The owner should be defined in the Ownable base contract
 //   Ensure that markPrice can only be called by the owner (the deployer of the collectible)

  //  HINT: The markPrice function uses an onlyOwner modifier which is currently not implemented anywhere!



// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address public owner;
    constructor (){
        owner = msg.sender;
    }
    modifier onlyOwner{
        require(owner == msg.sender, "Acesso negado, voce nao eh proprietario" );
        _;
    }
    
    
    
}



