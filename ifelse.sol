// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;

contract OddOrEven {
    // 判断输入的数字是奇数还是偶数
    function checkOddOrEven(uint number) public pure returns (string memory) {
        if (number % 2 == 0) {
            return "Even";
        } else {
            return "Odd";
        }
    }
}