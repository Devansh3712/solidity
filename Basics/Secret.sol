// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract Ownership {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be the owner of the smart contract");
        _;
    }

}

contract Vault {
    string secret;
    
    constructor(string memory _secret) public {
        secret = _secret;
    }
    
    function getSecret() public view returns(string memory) {
        return secret;
    }

}

// inherit other smart contracts
contract Secret is Ownership {
    address secretVault;
    
    constructor(string memory _secret) public {
        Vault _secretVault = new Vault(_secret);
        secretVault = address(_secretVault);
        super;
    }
    
    function getSecret() public view onlyOwner returns(string memory) {
        Vault _secretVault = Vault(secretVault);
        return _secretVault.getSecret();
    }

}
