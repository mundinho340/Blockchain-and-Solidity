// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    
    address  [] public members;

    
    modifier onlyMember(){
        require(isMember(msg.sender), "call is not a member");
        _;
    }
    function addMember(address _address) external onlyMember{
        members.push(_address);
    }
    constructor (){
        members.push(msg.sender);
    }
    function removeLastMember () external onlyMember {
        members.pop();
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
