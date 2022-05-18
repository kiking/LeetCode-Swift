//
//  Solution_137.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/18.
//

import Foundation

/*
 137. 只出现一次的数字 II（中等）
 https://leetcode.cn/problems/single-number-ii/
 */

// 00->01->10->00
class Solution_137 {
    func singleNumber(_ nums: [Int]) -> Int {
        var a = 0, b = 0
        for num in nums {
            a = (a ^ num) & ~b
            b = (b ^ num) & ~a
        }
        return a
    }
}
