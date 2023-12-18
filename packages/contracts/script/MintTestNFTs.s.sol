// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import { TestNFT } from "../src/TestNFT.sol";  

contract MintTestNFTs is Script {
    address constant EXPECTED_TEST_NFT_ADDRESS = 0x52320cAA3860d3Af218e5712CF6297CD228F84bE;

    function setUp() public {}

    function run() public {
        TestNFT testNFT = TestNFT(EXPECTED_TEST_NFT_ADDRESS);
        vm.startBroadcast();
        for (uint256 i = 0; i < 10; i++) {
            testNFT.mint();
        }
        vm.stopBroadcast();
    }
}
