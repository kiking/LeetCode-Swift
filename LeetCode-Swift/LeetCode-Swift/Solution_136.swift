//
//  Solution_136.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/18.
//

import Foundation

/*
 136. 只出现一次的数字（简单）
 https://leetcode.cn/problems/single-number/
 */

class Solution_136 {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for item in nums {
            res ^= item
        }
        return res
    }
}
