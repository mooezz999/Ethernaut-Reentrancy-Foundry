pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attack.sol";

contract AttackTest is Test {
    Attack myAttack;
    address bob = address(1);
    address alice = address(2);

    function setUp() public {
        myAttack = new Attack();
    }

    function testWithdrawFunction() public {
        vm.startPrank(bob);
        myAttack.attack();
        uint beforeBalance = myAttack.getBalance();
        myAttack.withdrawToEOA();
        uint afterBalance = myAttack.getBalance();
        vm.stopPrank();
        assertEq(bob.balance, beforeBalance);
        assertEq(afterBalance, 0);
    }
}
