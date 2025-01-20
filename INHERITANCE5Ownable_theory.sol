//Base Utility Contracts

//It is often quite useful for a base contract to provide utility functions and modifiers.

//Let's see an example:

contract Depositable {
    modifier requiresDeposit {
        require(msg.value >= 1 ether);
        _;
    }
}

contract Escrow is Depositable {
    address owner;
    constructor() requiresDeposit {
        owner = msg.sender;
    }
}

//Here the Escrow contract requires a deposit of at least 1 ether in order to deploy. Otherwise the transaction will revert.

//This requirement comes from the base contract Depositable and is used through the inherited requiresDeposit modifier.
