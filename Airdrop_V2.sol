// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
import "@openzeppelin/contracts/access/Ownable.sol";

contract Airdrop is Ownable {

     struct AirdropData {
        address receiver;
        uint256 amount;
        uint32 sequence;
    }
    
     function claim(bytes memory _data) public pure returns(address,uint256, uint32){
        AirdropData memory data = abi.decode(_data, (AirdropData));
        return (data.receiver, data.amount, data.sequence);
     }
    
}
