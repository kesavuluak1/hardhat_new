
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract WhitelistRegistry {
 address public admin;
 mapping(address=>bool) public whitelisted;
 constructor(){admin=msg.sender;}
 modifier onlyAdmin(){require(msg.sender==admin);_;}
 function add(address u) external onlyAdmin{whitelisted[u]=true;}
 function remove(address u) external onlyAdmin{whitelisted[u]=false;}
}
