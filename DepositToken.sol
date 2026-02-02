
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DepositToken is ERC20 {
 address public bank;
 constructor(string memory n,string memory s) ERC20(n,s){bank=msg.sender;}
 modifier onlyBank(){require(msg.sender==bank,"ONLY_BANK");_;}
 function mint(address to,uint a) external onlyBank{_mint(to,a);}
 function burn(address from,uint a) external onlyBank{_burn(from,a);}
}
