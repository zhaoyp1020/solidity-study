// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.17;
import "hardhat/console.sol";

contract require_assert{
    
    function splitEther(address payable addr1, address payable addr2) public payable {
        require(msg.value % 2 == 0, "Even value required."); // 检查传入的ether是不是偶数，函数开始的时候用require进行校验
        if (msg.value % 2 == 0){
            revert("Even value reverted.");
        }
        uint balanceBeforeTransfer = address(this).balance;
        addr1.transfer(msg.value / 2);
        addr2.transfer(msg.value / 2);
        assert(address(this).balance == balanceBeforeTransfer);//检查分账前后，本合约的balance不受影响

    }



}