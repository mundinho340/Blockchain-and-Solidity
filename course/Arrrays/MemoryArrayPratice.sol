Your Goal: Filter Even Numbers

   // Create a pure, external function called filterEven which takes 
   // an dynamic size array of unsigned integers as its only argument.
   // Find all the even numbers and add them to a new array in memory. 
   // This array should contain only the even numbers.
   // Return this new array.

   // Note: the return array should only be large enough to fit the even numbers inside. 
   // This means you'll need to figure out how many even numbers there are before instantiating the array.
   // SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven (uint [] calldata numbers) external pure returns(uint [] memory){
        uint count =0;
        for (uint i =0; i< numbers.length; i++){
            if(numbers[i]%2 ==0){
                count++;
            }
        }
        uint[] memory evenNumbers = new uint [](count);
        uint index =0;
        for (uint i =0 ; i< numbers.length; i++){
            if(numbers[i]%2==0){
                evenNumbers[index] = numbers[i];
                index ++;
            }
        }

        return evenNumbers;
    }
    
}



