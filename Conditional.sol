// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Conditional {
    
    function isEven(uint _num) public view returns(bool) {
        if (_num % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

}
