// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Hero{
    uint public health;
    constructor(uint _health){
        health = _health;
    }

    function takeDamage(uint damage) external {
        health -= damage;
    }

    enum AttackTypes {Brawl, Spell}
    function attack(address enemy) public virtual;
}