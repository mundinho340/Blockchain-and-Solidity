//Multiple Inheritance

//It's possible to inherit from multiple contracts.

//The derived contract will inherit state variables and functions from each base contract:

contract Base1 {
    uint a=5;
}

contract Base2{
    uint b=10;
}

contract Derived is Base1, Base2{
    
}

//You can see we specify the contracts to inherit from in a comma-separated list. The Derived contract is inheriting from both Base1 and Base2.
