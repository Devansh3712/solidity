// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Mappings {
    /*
     * mapping(key => value) name;
     * mapping is a key-value pair DS, like
     * hash-tables/dictionaries
     */
    mapping(string => address) public dict;

    // custom struct mapping
    mapping(uint => User) public details;

    /*
     * Nested mapping =>
     * mapping(key1 => mapping(key2 => value2));
     */
    mapping(address => mapping(uint => User)) public data;
    
    
    struct User {
        string name;
        int id;
    }
    
    /*
     * constructor() =>
     * constructor is a function which runs
     * once when the smart contract is
     * initialized/deployed
     */
    constructor() public {
        dict["Devansh"] = 0x4C501d78c6Bf497d276dcB2D6aDD66B351CcDb85;
    }
    
    function addUser(uint _num, string memory _name, int _id) public {
        details[_num] = User(_name, _id);
    }
    
    function addData(uint _num, string memory _name, int _id) public {
        /*
         * msg.sender =>
         * ethereum address of person calling the
         * function
         */
        data[msg.sender][_num] = User(_name, _id);
    }

}
