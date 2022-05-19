//
//  Solution_201.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/19.
//

import Foundation

/*
 201. 数字范围按位与（中等）
 https://leetcode.cn/problems/bitwise-and-of-numbers-range/
 */

    // m 5 1 0 1
    //   6 1 1 0
    // n 7 1 1 1
    // 把n右边依次去掉1，直到<=m
    // m 5 1 0 1
    //   6 1 1 0
    // n 7 1 0 0
// n&m

class Solution_201 {
    func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
        var num = right
        while left < num {
            num = num&(num - 1)
        }
        return left&num
    }
}
