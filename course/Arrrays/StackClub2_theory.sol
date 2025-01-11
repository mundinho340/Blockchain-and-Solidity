//Pop

//Storage arrays also have access the pop member variable:

import "forge-std/console.sol";
contract Contract {
	uint[] public numbers;

    constructor() {
		numbers.push(3);
		numbers.push(4);
		console.log(numbers.length); // 2
		numbers.pop();
		console.log(numbers.length); // 1
        console.log(numbers[0]); // 3
    }
}

//As you can see, pop will take the top element off the storage array.
