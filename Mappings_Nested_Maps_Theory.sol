//Nested Mappings

//As shown in the previous stage, we can provide more complex types in our mapping values.

//Last stage we showed it with structs, now let's try it with other mappings!

mapping(uint => mapping(address => bool)) voteToAddressChoice;

function getVote(uint _id, address _addr) 
    external
    view 
    returns(bool)
{
    return voteToAddressChoice[_id][_addr];
} 

//In this scenario each vote id points to a mapping of addresses to bool votes. This allows each address to register a different vote with each vote id.

//As a voter we might call a function with an id to register our choice:

function registerVote(uint _id, bool _choice) external {
    voteToAddressChoice[_id][msg.sender] = _choice;
}

//Let's say there were 3 votes with the ids: 212, 72 and 409.

//We could make the following calls from external the contract:

// for true for vote id 212
votingContract.registerVote(212, true);
// for false for vote id 72
votingContract.registerVote(72, false);
// for true for vote id 409
votingContract.registerVote(409, true);

//This would register a true for the ids 212 and 409 at our address. For 72 it would register false.
