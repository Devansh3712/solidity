// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Crypto {
    address public owner;
    mapping(address => uint) public balances;
    
    /*
     * Events =>
     * allow clients to react to specific
     * contract changes that you declare
     */
    event Sent(address from, address to, uint amount);
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier isOwner {
        require(msg.sender == owner, "Only owner can mint coins");
        _;
    }
    
    function mint(address receiver, uint amount) isOwner public {
        require(amount < 1e60);
        balances[receiver] += amount;
    }
    
    /*
     * Errors =>
     * allow to provide information about why
     * an operation failed. They are returned
     * to the caller of the function
     */
    error InsufficientBalance(uint requested, uint available);
    
    function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
    
    function showBalance(address _account) external view returns (uint) {
        return balances[_account];
    }
    
}
