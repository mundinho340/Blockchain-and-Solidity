//Storage Arrays

//With arrays in storage you can use the push member function to add a new element at the end.

import "forge-std/console.sol";
contract Contract{
    uint[] public numbers;

    constructor(){
        numbers.push(3);
        console.log(numbers.length);//1
        numbers.push(4);
        console.log(numbers.length);//2
        console.log(numbers[0]); //3
        console.log(numbers[1]); //4
    }
}
