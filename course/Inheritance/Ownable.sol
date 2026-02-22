// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Ownable {
    modifier onlyOwner{
        require(msg.sender==owner,"Erro");
        _;
    }
    address owner =msg.sender;
    // function markPrice() onlyOwner{
        
    // }

}