//Constructor Inheritance

//In the previous example, the Base contract had a state variable with an initial value and a function to modify it.

//What if the Base contract had an initial value that was set in a constructor?

contract Base {
    uint public value;

    constructor (uint _value){
        value = _value;
    }
}

// Can we pass that initial value into the Base constructor when we're inheriting it?

//Sure can!

//Same syntax as invoking a function:

contract Derived is Base(10){
    
}
//See how we passed 10 into the Base contract? This is provided as a constructor argument!

    //It is possible to send multiple arguments to the constructor as well. This is also function syntax, comma-separated arguments within the parenthesis.
