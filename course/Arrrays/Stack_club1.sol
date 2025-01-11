//Stack Club

//This StackClub contract will have many members like a club or an organization would.
//We'll track these members by keeping a list of addresses.

//Members will be added by pushing their address to the top of the list.
//Members will be removed by popping the most recent one off of the list.
//A Last-In-First-Out structure, just like a stack!
//Your Goal: Add Members

    //Create a dynamic sized array of addresses called members
    //Create an external function addMember which has a single parameter:
    //an address for a new member. Add this address to the members array.
    //Create a public view function isMember that takes an address and returns
    //a bool indicating whether the address is a member or not.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address  [] public members;

    function addMember(address _address) external{
        members.push(_address);
    }

    function isMember(address _addresss) public view returns(bool){
        for(uint i=0 ; i< members.length; i++){
            if(members[i]== _addresss){
                return true;
            }
        }
        return false;
    }
}
