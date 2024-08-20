// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Custom ERC20 token contract with burnable functionality
contract DegenToken is ERC20, ERC20Burnable, Ownable {
	// Constructor function sets the token name and symbol
	constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}
	
	// Mapping to track redeemed items
	mapping(address => mapping(uint256 => bool)) public redeemedItems;

	// Event emitted when tokens are redeemed
	event Redeem(address indexed redeemer, uint256 indexed itemId, uint256 value, string itemName);

	// Function to mint new tokens, restricted to the owner
	function mint(uint256 amount, address recipient) external onlyOwner {
		_mint(recipient, amount);
	}

	// Function to redeem tokens for in-game items (fixed amount of 10 tokens)
	function redeem(uint256 itemId) external {
		uint256 redeemAmount = 10;

		// Check if the sender has enough balance to redeem
		require(balanceOf(msg.sender) >= redeemAmount, "Insufficient balance to redeem");

		// Ensure the item hasn't already been redeemed by the sender
		require(!redeemedItems[msg.sender][itemId], "Item already redeemed");

		// Deduct the redeem amount from the sender's balance
		_burn(msg.sender, redeemAmount);

		// Mark the item as redeemed
		redeemedItems[msg.sender][itemId] = true;

		// Get the item name based on itemId
		string memory itemName = getItemName(itemId);

		// Emit a Redeem event with the item name
		emit Redeem(msg.sender, itemId, redeemAmount, itemName);
	}

	// Function to get the name of an item based on itemId
	function getItemName(uint256 itemId) public pure returns (string memory) {
		if (itemId == 1) return "Phoenix Feather";
		if (itemId == 2) return "Dragon Scale";
		if (itemId == 3) return "Ethereal Essence";
		return "Unknown Item";
	}

	// Function to check the balance of the caller
	function checkBalance() external view returns (uint256) {
		return balanceOf(msg.sender);
	}


	// Function to get the current inventory of a player
	function getInventory(address account) external view returns (string[] memory) {
		uint256 itemCount = 10; // Number of predefined items
		uint256 inventoryCount = 0;

		// Count the number of redeemed items
		for (uint256 i = 1; i <= itemCount; i++) {
			if (redeemedItems[account][i]) {
				inventoryCount++;
			}
		}

		// Create an array to hold the names of redeemed items
		string[] memory inventory = new string[](inventoryCount);
		uint256 index = 0;

		// Populate the array with the names of redeemed items
		for (uint256 i = 1; i <= itemCount; i++) {
			if (redeemedItems[account][i]) {
				inventory[index] = getItemName(i);
				index++;
			}
		}

		return inventory;
	}
}
