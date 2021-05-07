// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Store {
    address payable public owner;
    uint total = 0;

    struct Database {
        string name;
        uint age;
    }

    mapping(address => Database) user;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    /*
     * @dev add user to database
     * @param _name => name of user
     * @param _age => age of user
     * @param _id => ethereum address of user
     */
    function createUser(string memory _name, uint _age, address _id) public {
        user[_id] = Database(_name, _age);
        total += 1;
    }

    /*
     * @dev delete user from database
     * @param _id => ethereum address of user
     */
    function deleteUser(address _id) isOwner public {
        delete user[_id];
        total -= 1;
    }

    /*
     * @dev update user details
     * @param _name => name of user
     * @param _age => age of user
     * @param _id => ethereum address of user
     * @return boolean value
     */
    function updateUser(string memory _name, uint _age, address _id) public returns(bool) {
        if (msg.sender == _id) {
            user[_id].name = _name;
            user[_id].age = _age;
            return true;
        } else {
            return false;
        }
    }

    /*
     * @dev returns a tuple of (name, age) for address
     * @param _id => ethereum address of user
     * @return value of user[_id]
     */
    function returnUser(address _id) public view returns(Database memory){
        return user[_id];
    }

    /*
     * @dev return number of users in database
     * @return value of 'total'
     */
    function numberOfUsers() public view returns(uint) {
        return total;
    }

}
