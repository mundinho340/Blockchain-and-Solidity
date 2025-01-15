//Accessing Struct Properties

//It's time to access some of the struct properties we stored! You can do this using the . operator. Let's see a few examples:

import "forge-std/console.sol";
contract X {
	contract X{
		struct Human{
			string name;
			uint age;
		}
		Human human = Human("Dan", 33);
		Human[] humans;

		constructor(){
			humans.push(human);		

			// read from this struct directy
			console.log(human.name); //Dan

			//read from the array of humans 
			console.log(humans[0].age); // 33
		}
	}
