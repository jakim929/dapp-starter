// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import { ERC721 } from "solmate/tokens/ERC721.sol";
import { LibString } from "solmate/utils/LibString.sol";

contract TestNFT is ERC721 {

  uint256 public currentTokenId;

  constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
  }

  function mintTo(address _to) public returns (uint256) {
    uint256 newTokenId = currentTokenId++;
    _safeMint(_to, newTokenId);
    return newTokenId;
  }

  function mint() public returns (uint256) {
    return mintTo(msg.sender);
  }

  function tokenURI(uint256 id) public pure override returns (string memory) {
    return LibString.toString(id);
  }
}
