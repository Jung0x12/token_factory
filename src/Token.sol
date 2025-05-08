// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20, Ownable {
    constructor(
        string memory name,
        string memory symbol,
        address initialOwner
    )
        ERC20(name, symbol)
        Ownable(initialOwner)
    { }

    function mint(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");
        _mint(to, amount);
    }

    function burn(uint256 amount) external onlyOwner {
        require(amount > 0, "Invalid amount");
        _burn(_msgSender(), amount);
    }
}
