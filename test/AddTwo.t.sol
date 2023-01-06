// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract AddTwoTest is Test {
    /// @dev Address of the SimpleStore contract.
    AddTwo public add;

    /// @dev Setup the testing environment.
    function setUp() public {
        add = AddTwo(HuffDeployer.deploy("AddTwo"));
    }

    /// @dev Ensure that you can set and get the value.
    function testAdd() public {
        uint256 a = 1;
        uint256 b = 2;
        uint256 c = 3;

        uint256 val = add.addTwo(a, b);
        console.log(val);
        assertEq(val, c);
    }
}

interface AddTwo {
    function addTwo(uint256, uint256) external view returns(uint256);
}