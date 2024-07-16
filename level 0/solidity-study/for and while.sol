// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;


contract Loop{
    uint[] public numbers;

    // 初始化数组
    constructor() {
        numbers = [1,2,3,4,5];
    }

    // 使用 for 循环计算数组综合
    function sumWithForLoop() public view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length;i++) {
            sum += numbers[i];
        }
        return sum;

    }


    // 使用while循环计算数组总和
    function sumWithWhileLoop() public view returns (uint) {
        uint sum = 0;
        uint i = 0;
        while (i < numbers.length) {
            sum += numbers[i];
            i++;
        }
        return sum;
    }

    // do while
    function sumWithDoWhileLoop() public view returns (uint) {
        uint sum = 0;
        uint i = 0;
        if (numbers.length > 0) {
            do {
                sum += numbers[i];
                i++;
            } while (i < numbers.length);
        }
        return sum;
    }
}