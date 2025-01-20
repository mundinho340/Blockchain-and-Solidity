//Virtual & Override

//It's time to introduce two new function keywords: virtual and override.

//Sometimes we'll want to leave a function on a base contract open to re-implementation by its derived class.
//That's where these two new keywords come in. 
//The virtual keyword allows us to specify a function on a contract that can be overridden using the override keyword.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

// TODO: create Mage/Warrior Heroes

contract Mage is Hero(50){

}

contract Warrior is Hero(200){
    
}


contract Base {
    uint public value =5;
    
    function increaseValue() virtual external {
        value+=10;
    }
}

contract Derived is Base{

    function increaseValue() override external {
        value *=2;
    }
}

// In this case, both Derived and Base have different function bodies for increaseValue.

//The Derived contract will use its own implementation of increaseValue, which overrides the virtual function implemented in Base.


