pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SimpleERC721 is ERC721URIStorage, Ownable  {
     using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor () public ERC721 ("Collectible", "COLLECTIBLE"){}

    function mint(uint256 quantity) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        for (uint i = 0; i < quantity; i++) {
          _mint(msg.sender, newItemId);
          _setTokenURI(newItemId, "");
          return newItemId;
        }   
    }
    
    function withdraw() public onlyOwner  {
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);
    }
    
}