//Struct Arrays

//We can create an array of struct types, just like we would with any other data type!

// a dynamic size list of uints 
uint[] numbers;

struct Account {
	uint id;
	uint balance;
}

// a dynamic size list of Accounts
Account[] accounts;
accounts.push(Account(0,100));

console.log(accounts[0].id); //0
console.log(accounts[0].balance); //100

//Of course, push only works on storage arrays,
//as we learned in the lesson on arrays!
