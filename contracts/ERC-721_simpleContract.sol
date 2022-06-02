
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SimpleERC721 is ERC721Enumerable, Ownable  {
     using Counters for Counters.Counter;
     Counters.Counter private _tokenIds;

    constructor () public ERC721 ("Collectible", "COLLECTIBLE"){}

    function mint(uint256 quantity) public {
        for (uint i = 1; i <= quantity; i++) {
          _tokenIds.increment();
          uint256 newItemId = _tokenIds.current();
          _safeMint(msg.sender, newItemId);
        }   
    }

    function getSupply() public view returns(uint256){
        return _tokenIds.current();
    }
    
    function withdraw() public onlyOwner  {
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);
    }
    
}


