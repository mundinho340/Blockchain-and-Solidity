//Your Goal: Transfer Amount

    //Create an external function called transfer which takes two parameters: an address for the recipient and a uint for the amount.
   // In this function, transfer the amount specified from the balance of the msg.sender to the balance of the recipient address.

//Contract Security

    //Ensure that both addresses used in the transfer function have active users.
   // Ensure that the msg.sender has enough in their balance to make the transfer without going into a negative balance.
   // If either of these conditions aren't satisfied, revert the call.


   // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		if(users[msg.sender].isActive ){
			revert("Bro ja estas activo");
		}
		users[msg.sender].balance= 100;
		users[msg.sender].isActive= true;
		
	}

	function transfer(address _toRecipient, uint amount) external {
		if(users[_toRecipient].isActive){
			if(users[msg.sender].balance> amount && users[msg.sender].balance >0){
				users[msg.sender].balance -=amount;
				users[_toRecipient].balance +=amount;
			}else{

				revert("Bro nao estas activo");
			}
		}else{

			revert("Bro nao tens saldo suficiente");
		}
	}

}



