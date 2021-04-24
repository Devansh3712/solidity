// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Test {

    // payable => ether can be paid to the address
    address payable public owner;
    /*
    enum =>
    
    collection of immutable options
    */
    enum Status { Vacant, Occupied }
    Status currentStatus;
    
    event Occupy(address _occupant, uint _value);
    
    constructor() public {
        owner = msg.sender;
        currentStatus = Status.Vacant;
    }
    
    /*
    modifier =>
    
    includes a "require" statement, checks if condition
    is met in the function else returns error message
    */
    modifier checkVacancy {
        require(currentStatus == Status.Vacant, "Room is occupied");
        _;
    }
    
    /*
    receive() =>
    
    it is a special function which runs when the
    smart contract owner receives a payment
    */
    receive() external payable checkVacancy {
        /*
        require(condition, error_message) =>
        
        if the condition is true, continues to
        run the function else returns error message
        */
        require(msg.value == 1 ether, "Wrong amount");
        
        currentStatus = Status.Occupied;
        owner.transfer(msg.value);
        
        emit Occupy(msg.sender, msg.value);
    }

}
