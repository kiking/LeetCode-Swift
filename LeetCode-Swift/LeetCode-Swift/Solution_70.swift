//
//  Solution_70.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/25.
//

import Foundation

/*
 70. 爬楼梯（简单）
 https://leetcode.cn/problems/climbing-stairs/
 */

class Solution_70 {
    // 动态规划
    func climbStairs(_ n: Int) -> Int {
        var x1 = 0, x2 = 0, x3 = 0
        for _ in 1...n {
            x3 = x1 + x2
            x1 = x2
            x2 = x3
        }
        return x3
    }
    
    func climbStairs_a(_ n: Int) -> Int {
        var cache = [Int](repeating: 0, count: n + 1)
        func dfs(_ n: Int) -> Int {
            if cache[n] != 0 {
                return cache[n]
            }
            if n <= 2 {
                return n
            }
            cache[n] = dfs(n - 1) + dfs(n - 2)
            return cache[n]
        }
        return dfs(n)
    }
}
