//Mapping

//Mappings allow you to store and retrieve elements quickly with a key.
//The key points to a location in memory where the value is stored.

//The key can be any basic data type in Solidity.
//It cannot be a reference data type like a struct or an array.

//The value, on the other hand, can be any Solidity type.
//It can be a struct, an array or even another mapping!

//Let's see an example of a mapping:

import "forge-std/console.sol";
contract Contract{
    //create a score state variable
    //maps an address (key) to a uint(value)

    mapping(address => uint) public score;

    function addPoint() external {
        console.log(score[msg.sender]);

        score[msg.sender]++;
        console.log(score[msg.sender]);
    }
}
