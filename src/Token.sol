// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import { ERC20Upgradeable } from "openzeppelin-contracts-upgradeable/contracts/token/ERC20/ERC20Upgradeable.sol";
import { OwnableUpgradeable } from "openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";
import { UUPSUpgradeable } from "openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";

contract Token is ERC20Upgradeable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(string memory name, string memory symbol, address initialOwner) public initializer {
        __ERC20_init(name, symbol);
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Invalid amount");
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        require(amount > 0, "Invalid amount");
        _burn(_msgSender(), amount);
    }

    function _authorizeUpgrade(address) internal override onlyOwner { }
}
