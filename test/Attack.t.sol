pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Attack.sol";

contract AttackTest is Test {
    Attack myAttack;
    address bob = address(1);
    address alice = address(2);

    function setUp() public {}

    function testWithdrawFunction() public {
        vm.deal(bob, 1);
        vm.startPrank(bob);
        myAttack = new Attack();
        vm.deal(address(myAttack), 50);
        myAttack.attack();
        uint beforeBalance = myAttack.getBalance();
        myAttack.withdrawToEOA();
        uint afterBalance = myAttack.getBalance();
        vm.stopPrank();
        assertEq(bob.balance, beforeBalance + 1);
        assertEq(afterBalance, 0);
        assertEq(beforeBalance, 50);
    }
}
