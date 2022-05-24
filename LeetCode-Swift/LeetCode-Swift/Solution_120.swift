//
//  Solution_120.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/23.
//

import Foundation

/*
 120. 三角形最小路径和（中等）
 https://leetcode.cn/problems/triangle/
 */

class Solution_120 {
    // 自顶向下的递归，深度优先搜索，缓存已经被计算的值
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var cache = Dictionary<String, Int>()
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == triangle.count {
                return 0
            }
            if let item = cache["\(i)-\(j)"] {
                return item
            }
            let res = min(dfs(i+1, j), dfs(i+1, j+1))+triangle[i][j]
            cache["\(i)-\(j)"] = res
            return res
        }
        return dfs(0, 0)
    }
    
    // 动态规划（自底向上），空间优化O(N)
    func minimumTotal_a(_ triangle: [[Int]]) -> Int {
        let count = triangle.count
        var dp = [Int](repeating: 0, count: count + 1)
        for i in (0...(count - 1)).reversed() {
            for j in 0...i {
                dp[j] = min(dp[j], dp[j+1]) + triangle[i][j]
            }
        }
        return dp[0]
    }
    
    // 动态规划（自顶向下），空间优化O(N)
    func minimumTotal_b(_ triangle: [[Int]]) -> Int {
        let count = triangle.count
        
        var dp = [Int](repeating: 0, count: count)
        dp[0] = triangle[0][0]
        for i in 1..<count {
            dp[i] = dp[i - 1] + triangle[i][i]
            for j in (1..<i).reversed() {
                dp[j] = min(dp[j], dp[j-1]) + triangle[i][j]
            }
            dp[0] = dp[0] + triangle[i][0]
        }
        var minTotal = dp[0]
        for i in 1..<count {
            minTotal = min(minTotal, dp[i])
        }
        return minTotal
    }
    
    func test() {
        let triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
        print(minimumTotal_a(triangle))
    }
}
