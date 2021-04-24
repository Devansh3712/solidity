// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Loop {
    
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function isEven(uint _num) public view returns(bool) {
        if (_num % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }
    
    function countEven(uint[] memory _arr) public view returns(uint) {
        uint count = 0;
        
        for (uint i = 0; i < _arr.length; i++) {
            if (isEven(_arr[i]) == true) {
                count++;
            }
        }
        
        return count;
    }
    
    function isOwner() public view returns(bool) {
        return (msg.sender == owner);
    }

}
