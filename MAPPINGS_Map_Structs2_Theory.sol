//Types of Balances

//Broadly speaking, smart contracts deal with two type of value transfers:

  //  the native currency (ether), which is stored and transferred using the native EVM mechanisms, 
  //  the value in the message call, and the balance on an address
  //  a storage value which can represent any kind of value on-chain, and is updated by modifying storage variables

//In the smart contract you are building, you are maintaining your own balances in the User struct that has no relation to ether.
//This means, to transfer balances from one user to another, you can just update the struct value!
