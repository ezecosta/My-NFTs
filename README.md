# MyNFT
Smart contract for creating and managing non-fungible tokens (NFTs) based on the ERC721 standard.

## License
This code is licensed under the MIT license.

## Overview
The MyNFT contract is an implementation of the ERC721 standard using the OpenZeppelin library. It allows the creation and management of unique NFTs. Each token has a unique identifier and associated metadata stored on-chain.

## Inheritance
ERC721URIStorage: Inherited from the OpenZeppelin library, providing functionality for storing and managing token metadata.

## Constructor
```solidity
constructor(uint _price) ERC721("MyNFT", "NFT")
```
- Initializes the contract with a given price for minting NFTs.
- Sets the contract owner to the address that deployed the contract.

## Modifiers
### onlyOwner
```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Only the owner can authorize users.");
    _;
}
```
- Restricts access to functions with this modifier to only the contract owner.

## State Variables
- _tokenIds: An internal counter for tracking the token IDs and ensuring uniqueness.
- owner: The address of the contract owner.
- price: The price in ether required for minting an NFT.

## Functions
### mintNFT
```solidity
function mintNFT(address recipient, string memory tokenURI) public onlyOwner payable returns (uint256)
```
- Allows the contract owner to mint a new NFT and assign it to the specified recipient.
- Requires payment of the specified price in ether to mint the NFT.
- Generates a unique token ID and associates it with the recipient.
- Sets the token URI (metadata) for the NFT.

Note: The onlyOwner modifier ensures that only the contract owner can call this function.

This is a simplified explanation of the code. For more details, refer to the comments in the code and the OpenZeppelin documentation for ERC721 and ERC721URIStorage.
