// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { Script, console2 } from "forge-std/Script.sol";

import { TokenFactory } from "src/TokenFactory.sol";

contract TokenFactoryScript is Script {
    function run() public {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        TokenFactory tokenFactory = new TokenFactory();
        console2.log("Deployed TokenFactory at", address(tokenFactory));

        vm.stopBroadcast();
    }
}
