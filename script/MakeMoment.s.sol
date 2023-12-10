// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import { Script } from "forge-std/Script.sol";
// import { HelpersConfig } from "script/helpers/HelpersConfig.s.sol";
import { ProfileNft } from "../src/ProfileNft.sol";
import { HelpersConfig } from "./helpers/HelpersConfig.s.sol";

contract MakeMoment is Script, HelpersConfig {
    

    function run()  external {
        address profile1 = 0x7F13bFEA03318Dc3f615b68BAAE08c7596E651c3;
        bytes32 digest = keccak256(abi.encode(address(profile1)));
        uint privateKey = vm.envUint("SEPOLIA_PRIVATE_KEY");
        (uint8 v2, bytes32 r2, bytes32 s2) = vm.sign(privateKey, digest);
        bytes memory user2Signature = abi.encodePacked(r2, s2, v2);
        ProfileNft profile = ProfileNft(profile1);
        vm.startBroadcast();
        profile.mint(0xb859f5221d6DB9398101C6f60922cFbaDe5bDD98,user2Signature,0);
        vm.stopBroadcast();
        // return profileAddress;
    }
}