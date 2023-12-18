// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import { TestNFT } from "../src/TestNFT.sol";  

contract DeployTestNFT is Script {
    address constant EXPECTED_TEST_NFT_ADDRESS = 0x52320cAA3860d3Af218e5712CF6297CD228F84bE;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        if(EXPECTED_TEST_NFT_ADDRESS.code.length == 0) {
            TestNFT testNFT = new TestNFT{ salt: 0 }("TestNFT", "TNFT");
            console.log("TestNFT deployed at address: %s", address(testNFT));
        } else {
            console.log("TestNFT already deployed at address: %s", EXPECTED_TEST_NFT_ADDRESS);
        }
        vm.stopBroadcast();
    }
}
