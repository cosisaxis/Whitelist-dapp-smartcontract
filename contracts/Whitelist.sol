//SPDX-License-Identifier: unlicense

pragma solidity ^0.8.0;

contract Whitelist{

    uint8 public maxWhitelistedAddresses;
     
    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses){
       maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "This sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses,"We have reached our whiteliste limit" );

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}

