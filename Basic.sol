pragma solidity ^0.8.4;

contract Basic {
    uint public count = 0;
    
    function incrementCount() public {
        count++;
    }
    
    function resetCount() public {
        count = 0;
    }
}
