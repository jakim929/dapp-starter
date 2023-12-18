// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import { LibString } from "solmate/utils/LibString.sol";
import "forge-std/Test.sol";
import "../src/TestNFT.sol";

contract TestNFTTest is Test {
  TestNFT testNFT;
  address bob;
  address sally;

  function setUp() public {
    testNFT = new TestNFT("TestNFT", "TNFT");
    bob = makeAddr("bob");
    sally = makeAddr("sally");
    
    vm.deal(bob, 100 ether);
    vm.deal(sally, 100 ether);
  }

  function test_mint_toSender_succeeds() public {
    vm.prank(bob);
    uint256 tokenId = testNFT.mint();

    assertEq(testNFT.ownerOf(tokenId), bob);
    assertEq(testNFT.balanceOf(bob), 1);
  }

  function test_mintTo_toDifferentOwner_succeeds() public {
    vm.prank(bob);
    uint256 tokenId = testNFT.mintTo(sally);

    assertEq(testNFT.ownerOf(tokenId), sally);
    assertEq(testNFT.balanceOf(bob), 0);
    assertEq(testNFT.balanceOf(sally), 1);
  }

  function test_tokenUri_returnsTokenId_succeeds() public {
    vm.prank(bob);
    uint256 tokenId = testNFT.mint();

    assertEq(testNFT.tokenURI(tokenId), LibString.toString(tokenId));
  }
}
