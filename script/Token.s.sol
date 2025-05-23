// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { Script, console2 } from "forge-std/Script.sol";

import { Token } from "src/Token.sol";

contract TokenScript is Script {
    function mint(Token token, address to, uint256 amount) public {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        token.mint(to, amount);

        console2.log("Minted", amount, "to", to);

        vm.stopBroadcast();
    }

    function burn(Token token, uint256 amount) public {
        vm.startBroadcast();

        token.burn(amount);

        console2.log("Burned", amount);

        vm.stopBroadcast();
    }
}
