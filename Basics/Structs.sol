// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Structs {
    /*
     * State variable =>
     * scope of variable is global
     * (can be used in the whole program)
     */
    uint public myUint = 1; // uint => unsigned integer (positive values)
    address public myAddress = 0x4C501d78c6Bf497d276dcB2D6aDD66B351CcDb85; // ethereum address
    string public myString = "Hello World!";
    
    /*
     * Struct =>
     * create custom data structures
     */
    struct MyStruct {
        address id;
        uint amount;
    }
    
    MyStruct public myStruct = MyStruct(0x4C501d78c6Bf497d276dcB2D6aDD66B351CcDb85, 1);
    
    /*
     * local variable =>
     * scope of variable is only inside the
     * function
     */
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }
}
