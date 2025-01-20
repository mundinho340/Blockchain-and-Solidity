//Super Call

//In the last stage we wrote an override function for an unimplemented function on the base contract.

//In other cases, the base contract will have functionality in its virtual functions that we want to share with our derived contracts. That's when it's time to use super.
contract Base {
    uint public value =10;

    function modify() virtual external {
        value *=2;
    }
}

contract Derived is Base {
    function modify() virtual override external {
        value+=20;
        super.modify();
    }
}

 //You can see in our Derived contract we are modifying the value and then calling super.modify to invoke the function on the base contract as well. 
//This will first perform value += 20 from the override function, then perform value *= 2 from the super function, resulting in value=60.

//With arguments this works like any other function: we would pass through arguments to super.modify().
