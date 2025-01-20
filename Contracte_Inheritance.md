Contract Inheritance

As with many object-oriented languages, Solidity includes inheritance as a feature.

Inheritance means that you can create an object with some values/methods and use it as a base for other objects.

In Solidity, the objects we're referring to are contracts and interfaces. We can write a contract with state variables and functions. Then we can create contracts that inherit those variables and functions. These derived contracts can then choose to add behavior as necessary.

This use case may seem quite similar to libraries! Just like libraries, code re-use is a big motivation for inheritance. We'll take a look at why inheritance can be a more powerful feature than libraries. Of course, that power comes with tradeoffs! With time and practice you'll be able to understand these tradeoffs and figure out which tool is right for the particular job at hand.
