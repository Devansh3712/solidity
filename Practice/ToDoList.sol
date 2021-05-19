// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

// @title To-do-list with solidity
contract ToDoList {

    // contract variables
    address public owner;
    mapping(address => string[]) tasklist;
    string public name;
    int public version;
    
    // @dev when a task is added to tasklist
    event Added(address _user, string _task);
    // @dev when a task is removed from tasklist
    event Removed(address _user, string _task);
    // @dev when a user is deleted from database
    event Purged(address _user);

    // @dev change state of task removal
    // @default False
    enum removalState { True, False }
    removalState deleted;

    constructor() {
        owner = msg.sender;
        name = "To-do-list with solidity";
        version = 1.0;
        deleted = removalState.False;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the owner of contract can call this function"
        );
        _;
    }

    modifier listLength(address _user) {
        require(
            tasklist[_user].length > 0,
            "There are no tasks in the list"
        );
        _;
    }

    // @dev add task for a user to the tasklist
    // @param _user => address of the user
    // @param _task => task to be added
    // @returns boolean value
    function addTask(address _user, string memory _task) public returns(bool) {

        uint currentLength = tasklist[_user].length;
        tasklist[_user].push(_task);

        if (currentLength + 1 == tasklist[_user].length) {
            emit Added(_user, _task);
            return true;
        } else {
            return false;
        }
    }

    // @dev add task for a user to the tasklist
    // @param _user => address of the user
    // @param _task => task to be removed
    // @returns boolean value
    function removeTask(address _user, string memory _task) public listLength(_user) returns(bool) {

        for (uint index = 0; index < tasklist[_user].length; index++) {
            if (keccak256(abi.encodePacked(tasklist[_user][index])) == keccak256(abi.encodePacked(_task))) {
                delete tasklist[_user][index];
                deleted = removalState.True;
                emit Removed(_user, _task);
            }
        }

        if (deleted == removalState.True) {
            return true;
        } else {
            return false;
        }
    }

    // @dev show tasks of a user
    // @return an array of tasks
    function showTasks(address _user) public view returns(string[] memory){
        return tasklist[_user];
    }

    // @dev show number of tasks of a user
    // @return number of tasks
    function numberOfTasks(address _user) public view returns(uint) {
        return tasklist[_user].length;
    }

    // @dev remove user and their tasklist
    function purgeUser(address _user) public onlyOwner {

        delete tasklist[_user];
        emit Purged(_user);
    }

}
