// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
import "@openzeppelin/contracts/access/Ownable.sol";

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}
 
contract Airdrop is Ownable {

   mapping (address => mapping(address => uint256)) public AirdropMap; 
   
   function getClaimableAmount(address _tokenAddr, address _claimAddr) public view virtual returns (uint256) {
       return AirdropMap[_tokenAddr][_claimAddr]; 
   }

   
   function airdrop(address _tokenAddr, address[] memory dests, uint256[] memory values) public onlyOwner returns (bool) {
        require(dests.length == values.length, 'dests length should equal values length');
        for (uint i = 0; i < dests.length; ++i) {
            AirdropMap[_tokenAddr][dests[i]] += values[i];
        }
        return true;
    }
    
    function claim(address _tokenAddr) public returns(bool){
        require(AirdropMap[_tokenAddr][msg.sender] > 0);
        IERC20(_tokenAddr).transfer(msg.sender, AirdropMap[_tokenAddr][msg.sender]);
        AirdropMap[_tokenAddr][msg.sender] = 0;
        return true;
    }
    
}
