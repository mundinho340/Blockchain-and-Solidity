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
Hero hero = Hero(Directions.Up, 100, true);

console.log(hero.facing == Directions.Up);
//true 
console.log(hero.health); //100
console.log(hero.inAir); //true

