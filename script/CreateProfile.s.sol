// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
// import { HelpersConfig } from "script/helpers/HelpersConfig.s.sol";
import { ProfileFactory } from "../src/ProfileFactory.sol";
import { HelpersConfig } from "./helpers/HelpersConfig.s.sol";

contract CreateProfile is Script {

        string uri = "ipfs://ldanfjsdnfsdnljmalkm";
    string name = "0xnightfall.eth";
    string symbol = "sh4";

    function run()  external returns (address){
        ProfileFactory factory = ProfileFactory(0xF831f7693d3F5997816eD4c809D1A41cFc860C1b);
        vm.startBroadcast();
        address profileAddress = factory.createProfile(name,symbol,uri);
        vm.stopBroadcast();
        return profileAddress;
    }
}