// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Array {
    // Initialize array
    uint[] public arr = [1, 2, 3];
    string[] public values;
    
    // Multi dimensional array
    uint[][] public arr2D = [[1, 2, 3], [4, 5, 6]];
    
    function addValue(string memory _value) public {
        /*
        *array.push(value) =>
        *appends value to the end of the array
        */
        values.push(_value);
    }
    
    function lenValue() public view returns(uint) {
        /*
        *array.length =>
        *gives the length of the array
        */
        return values.length;
    }
}
