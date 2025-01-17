 //Your Goal: Remove Member

//Create an external function called removeMember that will take an address and set its corresponding 
//value in the members mapping to false.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;
   
    function addMember(address _address) external{
        members[_address]= true;

    }

    function isMember(address _address) external view returns(bool){
        if(members[_address]){
            return true;
        }

        return false;
    }

    function removeMember(address _address) external {
        members[_address] = false;
    }
}






