// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract HelloWorldTest is Test {
     using Strings for uint256;
    /// @dev Address of the SimpleStore contract.
    HelloWorld public helloWorld;

    /// @dev Setup the testing environment.
    function setUp() public {
        helloWorld = HelloWorld(HuffDeployer.deploy("HelloWorld"));
    }

    /// @dev Ensure that you can set and get the value.
    function testHelloWorld() public {
        string memory expectedBytes = "Hello, world!";
        bytes32 expectedBytes = "Hello, world!";
       // uint256 expectedBytes = 0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000d48656c6c6f2c20776f726c642100000000000000000000000000000000000000;

       // variable = String.toString( uint256( numberInUint64 ));
        console.log(expectedBytes);
        uint256 val = helloWorld.helloWorld();
        console.log(val);
        //string strVal = String.toString( uint256( val ));
       // console.log(strVal);
        assertEq(val, expectedBytes);
    }
}

interface HelloWorld {
    function helloWorld() external view returns(uint256);
}