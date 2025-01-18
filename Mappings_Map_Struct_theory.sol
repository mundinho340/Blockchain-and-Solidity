//Mapping to Struct

//Here's where mappings get interesting! We can map to many different types.
//Let's start with structs:

contract Market {
	struct Collectible {
		address owner;
		bool forSale;
		uint price;
	}

	mapping(uint => Collectible) idToCollectible;

	function purchase(uint _id) external payable {
		Collectible storage collectible = idToCollectible[_id];

		require(msg.value >= collectible.price);
		collectible.owner = msg.sender;
		collectible.forSale= false;
	}

}

 //We are able to lookup the collectible using the uint id passed into purchase. Then we have access to the struct to sell it to its new owner.
