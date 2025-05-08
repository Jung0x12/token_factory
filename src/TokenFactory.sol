// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { Token } from "./Token.sol";

contract TokenFactory {
    event TokenCreated(address indexed tokenAddress, address indexed owner);

    function createToken(string memory name, string memory symbol, address initialOwner) public returns (address) {
        Token token = new Token(name, symbol, initialOwner);
        emit TokenCreated(address(token), initialOwner);
        return address(token);
    }
}
