#Hello guys this is my note explanaition this method.

## :anger: Voting:A Real World Contract 

### :adult: Any member can make a proposal 
### 🎱 member can vote on whether they like it 
### 🥉 After a yes threshold is met, the proposal is executed 
### 🥈 THe proposal contains calldata to be sent to a contract 


#### 🥇 Since the proposal can execute a message call, it could be anything from moving
#### 💯 some funds to buying an NFT!
 
#### 👍 The contract becomes like an EOA that requires voter approval 
#### for each of its actions


# Proposal Steps:
## Create a new proposal Struct in storage.
## Allow members to vote on the proposal by its id.
## Once a Vote_Threshold has been hit, send the calldata to the target contract.

# Voting Contract

## In this tutorial we're going to build a voting contract! We'll use the lessons learned here to understand how the Governor standard emerged
Proposals

#### We're going to focus on creating a voting contract that will allow members to create new proposals. This contract can contain many proposals which will be voted on by a group of members. Each proposal will keep track of its votes to decide when its time to execute.

#### At execution time, these proposals will send calldata to a smart contract. The calldata could be anything! We could have a Voting system that allows 100 members to decide when to upgrade a protocol. The calldata might target a function with the signature upgrade(address) and send over the new protocol implementation. That would be a very cool use of your Voting contract!