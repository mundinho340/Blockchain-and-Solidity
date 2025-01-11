//Memory Arrays

//Unlike storage arrays, memory arrays do not have a push member function.

//Memory arrays can have a dynamic size if the size is provided during initializati/on.

//For example:

import "forge-std/console.sol";
contract Contract {
	uint x = 5;

	function createArray() view external {
		address[] memory addresses = new address[](x);
		console.log( addresses.length ); // 5
	}
}
