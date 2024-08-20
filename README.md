# DegenToken

A custom ERC-20 token contract with burnable functionality and in-game item redemption, designed to be used with Remix IDE.

## Description

DegenToken is an ERC-20 token contract that includes features for minting tokens, redeeming tokens for in-game items, and checking balances and inventories. This smart contract leverages OpenZeppelin's ERC20 and ERC20Burnable standards to ensure reliable token operations and allows for item redemption using a fixed number of tokens.

## Getting Started

### Installing Remix IDE

1. **Access Remix IDE**

   Open [Remix IDE](https://remix.ethereum.org/) in your web browser. Remix is a web-based tool, so no local installation is needed.

### Executing Program

1. **Create a New File**

   - In Remix IDE, navigate to the "File Explorers" tab.
   - Click on the "+" icon to create a new file.
   - Name the file `DegenToken.sol`.

2. **Paste the Contract Code**

   Copy and paste the provided smart contract code into `DegenToken.sol`.

3. **Compile the Contract**

   - Go to the "Solidity Compiler" tab.
   - Select the appropriate compiler version (0.8.9 or compatible).
   - Click on "Compile DegenToken.sol".

4. **Deploy the Contract**

   - Switch to the "Deploy & Run Transactions" tab.
   - Ensure the environment is set to "Injected Provider - MetaMask" for testing.
   - Click on "Deploy" to deploy the contract.

5. **Interact with the Contract**

   After deployment, the contract instance will appear in the "Deployed Contracts" section. You can interact with it using the following buttons:

   - **Mint Tokens:**

   - **Redeem Tokens for an Item:**

   - **Check Balance:**

   - **Get Inventory:**

## Help

For common issues or troubleshooting in Remix IDE:

- Ensure the contract compiles without errors.
- Verify that you are using the correct environment for deployment (JavaScript VM, Injected Web3, etc.).
- Ensure you have sufficient gas in the Remix environment for transactions.

For more help, refer to the [Remix IDE documentation](https://remix-ide.readthedocs.io/en/latest/) or consult the [OpenZeppelin documentation](https://docs.openzeppelin.com/contracts/).

## Authors

Shawaiz Islam  

## License

This project is licensed under the MIT License
