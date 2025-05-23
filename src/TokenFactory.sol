// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import { Token } from "./Token.sol";

contract TokenFactory {
    event TokenCreated(address indexed tokenAddress, address indexed owner);

    function createToken(
        string memory name,
        string memory symbol,
        address initialOwner
    )
        public
        returns (address proxy, address implementation)
    {
        bytes memory initializeData =
            abi.encodeWithSelector(Token.initialize.selector, name, symbol, initialOwner);
        implementation = address(new Token());
        proxy = address(new ERC1967Proxy(implementation, initializeData));

        emit TokenCreated(proxy, initialOwner);
    }
}
