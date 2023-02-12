// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract HelloWorldTest is Test {
    /// @dev Address of the SimpleStore contract.
    HelloWorld public helloWorld;

    /// @dev Setup the testing environment.
    function setUp() public {
        helloWorld = HelloWorld(HuffDeployer.deploy("HelloWorld"));
    }

    /// @dev Ensure that you can set and get the value.
    function testHelloWorld() public {
        string memory expectedString = "Hello, world!";

        console.log(expectedString);
        string memory val = helloWorld.helloWorld();
        console.log(val);
        assertEq(val, expectedString);
    }
}

interface HelloWorld {
    function helloWorld() external view returns(string memory);
}