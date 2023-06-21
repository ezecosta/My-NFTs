//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFTs is ERC721URIStorage {
    uint private _tokenIds;
    address payable owner;
    uint price;

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can authorize users.");
        _;
    }

    constructor(uint _price) ERC721("MyNFT", "NFT") {
        owner = payable(msg.sender);
        price = _price;
    }

    //enable the nft to be assigned to other user within the blockchain
    //we're using the onlyOwner modifier for this, could be removed
    function mintNFT(address recipient, string memory tokenURI) public onlyOwner payable returns (uint256)
    {
        _tokenIds = _tokenIds + 1;
        _mint(recipient, _tokenIds);
        _setTokenURI(_tokenIds, tokenURI);

        return _tokenIds;
    }
}
