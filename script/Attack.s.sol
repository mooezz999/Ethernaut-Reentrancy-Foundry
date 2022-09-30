// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Attack.sol";

contract AttackScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Attack attack = new Attack(
            payable(0xbB935E0f6cfceDA3f9D749E9921c36bD290E9A5C)
        );

        vm.stopBroadcast();
    }
}
