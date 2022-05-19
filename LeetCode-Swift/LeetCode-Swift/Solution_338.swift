//
//  Solution_338.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/19.
//

import Foundation

/*
 338. 比特位计数（简单）
 https://leetcode.cn/problems/counting-bits/
 */

// 用i比i&(i-1)多一个1（在最低有效位）来动态规划
class Solution_338 {
    func countBits(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        var res = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            res[i] = res[i&(i-1)] + 1
        }
        return res
    }
}
