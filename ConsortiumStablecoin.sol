
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ConsortiumStablecoin is ERC20 {
 address public controller;
 mapping(address=>uint256) public pendingForBank;
 constructor() ERC20("Consortium Stablecoin","CS"){controller=msg.sender;}
 modifier onlyController(){require(msg.sender==controller,"ONLY_CTRL");_;}
 function mint(address to,uint a) external onlyController{_mint(to,a);}
 function burn(address from,uint a) external onlyController{_burn(from,a);}
 function creditPending(address bank,uint a) external onlyController{pendingForBank[bank]+=a;}
 function clearPending(address bank,uint a) external onlyController{pendingForBank[bank]-=a;}
}
