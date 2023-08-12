# ETH-AVAX-MODULE-4
## LICENSCE
it is using the MIT license.

## VERSION
SOLIDITY VERSION ^0.8.9

## IMPORTS CONTRACTS FROM OPENZEPPELIN LIBRARY
* These lines import three different Solidity contracts from the OpenZeppelin library.
* The first import is for the ERC20 contract, which provides a basic implementation of the ERC20 token standard.
* The second import is for the ERC20Burnable contract, which extends ERC20 and adds functionality to burn tokens.
* The third import is for the Ownable contract, which provides a basic access control mechanism.

## contract
### Token Information:

* The token's name is "Degen Gaming Token."
* The token's symbol is "DGT."
* The token has 18 decimal places (standard for Ethereum-based tokens).
* The totalSupply variable holds the total supply of tokens.
## Ownership:
* The contract owner is the address that deploys the contract.
* The onlyOwner modifier restricts certain functions to be callable only by the contract owner.
Balances and Allowances:

`The balanceOf` mapping holds the balance of each address.
* The allowance mapping holds allowances granted by token holders to specific addresses for spending tokens on their behalf.
`Item Costs:`

The itemCosts mapping associates item IDs with their corresponding token costs.
`Events:`

* The Transfer event is emitted when tokens are transferred.
* The Approval event is emitted when allowances are granted.
* The Burn event is emitted when tokens are burned (destroyed).
* The Redeem event is emitted when a user redeems an in-game item using tokens.
`Modifiers:`

`onlyOwner:` Ensures that only the owner can execute certain functions.
`Constructor:`

* The constructor initializes the contract with an initial supply of tokens, which is multiplied by 10^18 to account for the 18 decimal places. The tokens are assigned to the contract owner.
Token Transfer Functions:

* `transfer:` Allows users to transfer tokens to another address.
* `approve:` Allows users to grant an allowance to another address to spend tokens on their behalf.
* `transferFrom:` Allows an address with an allowance to transfer tokens on behalf of the token holder.
## `Minting and Burning:`

`mint:` Only the owner can mint (create) new tokens and assign them to an address.
`burn:` Allows users to burn (destroy) their own tokens.
## `Item Cost and Redemption:`

`setItemCost:` Allows the owner to set the cost of a specific in-game item in terms of tokens.
`redeem:` Allows users to redeem an in-game item by paying the required token cost.


## snowtrace
verify your contrace at avalanche fuji testnet on snowtrace.io and check the contract transaction

## metamask
also set the network metamask to avalanchefuji network manually

and transfer testtoken from avalanche mainnet
