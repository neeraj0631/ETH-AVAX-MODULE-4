// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    mapping(string => uint256) private itemCost;

    event RewardRedeemed(address indexed account, string rewardName);

    constructor() ERC20("DegenToken", "DGN") {
        _mint(msg.sender, 10000 * 10 ** decimals());
        itemCost["Item1"] = 300;
        itemCost["Item2"] = 500;
        itemCost["Item3"] = 700;
        itemCost["Item4"] = 900;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function redeem(string memory itemName) public {
        uint256 cost = itemCost[itemName];
        require(cost > 0, "Reward not available");
        require(balanceOf(msg.sender) >= cost, "Insufficient balance");
        _burn(msg.sender, cost);
        emit RewardRedeemed(msg.sender, itemName);
    }

    // Allow receiving Ether
    receive() external payable {}

    // Fallback function to receive Ether
    fallback() external payable {}

    // Override to return the total supply of tokens
    function totalSupply() public view override returns (uint256) {
        return super.totalSupply();
    }
}
