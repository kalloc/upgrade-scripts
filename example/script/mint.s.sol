// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import "../src/ExampleSetupScript.sol";

/* 
# Anvil example

## Dry-run
forge script mint --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -vvvv

## Broadcast enabled
forge script mint --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -vvvv --broadcast
*/

contract mint is ExampleSetupScript {
    function __upgrade_scripts_init() internal override {
        __UPGRADE_SCRIPTS_ATTACH = true; // we only want to attach existing contracts
        // run the rest of the init script that loads `deploy-latest.json`
        super.__upgrade_scripts_init();
    }

    function run() external {
        // run the setup scripts; attach contracts
        setUpContracts();

        vm.startBroadcast();

        // do stuff
        nft.mint(msg.sender, 1);

        vm.stopBroadcast();
    }
}
