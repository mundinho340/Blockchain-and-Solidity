//Structs

//With structs we can create custom types in Solidity
//that are essentially groupings of variables.

//For instance:

enum Directions {Up, Down, Left, Right}

struct Hero {
	Directions facing;
	uint health;
	bool inAir;
}
