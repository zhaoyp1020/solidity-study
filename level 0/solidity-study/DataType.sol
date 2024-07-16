// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
import "hardhat/console.sol";


contract Integer {

    event Log(string message, uint256 value);

    function overflow() public pure returns (uint8) {
        uint8 a = 255; 
        uint8 b;

        // 使用 unchecked 块允许溢出而不引发异常
        unchecked {
            b = a+1;
        }


        // 记录溢出前后的值
        console.log("a=%s", a);
        console.log("a=%s", b);

        return b;
    }

    // 地址类型
    /*
    地址类型有三个成员变量，分别为：

    balance ：该地址的账户余额，单位是Wei
    code ：该地址的合约代码，EOA 账户为空，CA 账户为非空
    codehash ：该地址的合约代码的hash值
    */
    function get_balance() public view returns(uint256) {
        return address(this).balance; //获取地址账户余额，单位是wei
    }

    function get_code() public view returns(bytes memory) {
        return address(this).code; //获取合约代码，EOA账户为空，CA账户为非空
    }

    function get_codehash() public view returns(bytes32) {
        return address(this).codehash; //获取合约代码的hash值
    }

    //地址类型的5个成员函数
    /*
    transfer(uint256 amount): 向指定地址转账，不成功就抛出异常（仅address payable可以使用）
    send(uint256 amount): 与 transfer 函数类似，但是失败不会抛出异常，而是返回布尔值 （仅address payable可以使用）
    call(...): 调用其他合约中的函数
    delegatecall(...): 与 call 类似，但是使用当前合约的上下文来调用其他合约中的函数，修改的也是当前合约的数据存储
    staticcall(...): 于 call 类似，但是不会改变链上状态
    */

    // 枚举
    enum ActionChoices {
        GoLeft, //0
        GoRight, //1
        GoUp, //2
        GoDown //3
    }

    ActionChoices choice;

    function getChoice() public view returns (ActionChoices) {
        return choice;
    }

    // 数据切片
    function extraFourBytes(string calldata payload) public pure {
        string memory leading4Bytes = string(payload[:4]);
        console.log("leading 4 bytes: %s",leading4Bytes);
    }
    

    //动态数组成员函数
    uint[] arr;
    function pushPop() public {
        //刚开始没有任何元素
        arr.push();//数组有一个元素 [0]
        arr.push(1000);//数组有两个元素[0,1000]
        arr.pop();//数组剩下一个元素[0]
    }

    // 动态多维数组初始化
    uint[][] storageArr;
    function initArray() public {
        uint n = 2;
        uint m = 3;
        for(uint i = 0; i < n; i++){
            storageArr.push(new uint[](m));
        }
    }

}

/*
contract DataType {

    
    uint8 a = 1;
    uint8 b = a;

    // 引用传递
    bytes memory bts1 = "btc";
    bytes memory bts2 = bts1;

    console.log("bts1: %s", string(bts1));
    console.log("bts2: %s", string(bts2));

    bts2[0] = 'e';

    console.log("bts1: %s", string(bts1));
    console.log("bts2: %s", string(bts2));

    uint256 public zeroCount = 0;

    function isEven(uint256 num) private pure returns(bool) {
        return num%2 == 0;
    }

    // isZero 函数有副作用，会改变状态变量 zeroCount 的值
    function isZero(uint256 num) private  returns(bool) {
        if (num == 0) {
            zeroCount += 1;//函数副作用，会改变zeroCount的值
        }
        return num ==0;
    }
    

    function overflow() public view {
        uint8 a = 255;
        a = a + 1;
        console.log("a=%s", a);
    }
}

*/


