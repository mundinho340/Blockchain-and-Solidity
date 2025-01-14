//Returning Structs

//When you're returning structs or other reference types like arrays, 
//you have to clarify where the data is coming from using data location keywords: storage, 
//memory, or calldata.

//However, for external and public methods, you can't use the storage 
//keyword for the return parameter. The storage keyword would provide a direct
//reference to a location within the contract's own persistent storage, which cannot be accessed 
//outside of the contract. Use memory or calldata instead to return a copy of the data.

//Let's take a look at an example of a struct being returned in memory:

struct Hero {uint health}

function postHero(Hero hero) external {
	// take a Hero type as an external argument
	console.log(hero.health); //100
}

function getHero() external view returns (Hero memory){
	return Hero(100);
}
