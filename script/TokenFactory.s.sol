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

    function createToken(TokenFactory tokenFactory, string memory name, string memory symbol, address initialOwner) public {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        (address proxy, address implementation) = tokenFactory.createToken(name, symbol, initialOwner);

        console2.log("Created token at", proxy);
        console2.log("Implementation at", implementation);
        
        vm.stopBroadcast();
    }
}
