// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract Looop {
    function hasSpace(string memory input) public pure returns (bool) {
        bool result;
        for (uint i = 0;i < bytes(input).length; i++) {
            if (bytes(input)[i] == " ") {
                result = true;
                break ;
            }
        }

        console.log("result is : %s", result);
        return result;
    }


    function printOddNumbers() public pure  {
        for (uint i = 1;i <= 10; i++) {
            if (i % 2 ==0) {
                continue;
            }
            console.log(i);
        }
    }
}