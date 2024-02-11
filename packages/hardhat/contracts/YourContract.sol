//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// Useful for debugging. Remove when deploying to a live network.
import "hardhat/console.sol";
import "@account-abstraction/contracts/core/EntryPoint.sol";
import "@account-abstraction/contracts/interfaces/IAccount.sol";

/**
 * A smart contract that allows changing a state variable of the contract and tracking the changes
 * It also allows the owner to withdraw the Ether in the contract
 * @author BuidlGuidl
 */

contract Account is IAccount {
	uint public count;
	address public owner;

	constructor(address _owner) {
		owner = _owner;
	}

	function validateUserOp(
		UserOperation calldata,
		bytes32,
		uint256
	) external pure returns (uint256 validationData) {
		return 0;
	}

	function execute() external {
		count++;
	}
}

contract AccountFactory {
	function createAccount(address owner) external returns (address) {
		Account acc = new Account(owner);
		return address(acc);
	}
}
