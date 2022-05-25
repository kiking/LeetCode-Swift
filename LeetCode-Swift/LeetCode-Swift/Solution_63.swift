//
//  Solution_63.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/25.
//

import Foundation

/*
 63. 不同路径 II（中等）
 https://leetcode.cn/problems/unique-paths-ii/
 */

class Solution_63 {
    // 动态规划（自底向上）
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        guard m != 0 else {
            return 0
        }
        let n = obstacleGrid[0].count
//        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
//        dp[m][n - 1] = 1
//        for i in (0..<m).reversed() {
//            for j in (0..<n).reversed() {
//                if obstacleGrid[i][j] == 1 {
//                    dp[i][j] = 0
//                } else {
//                    dp[i][j] = dp[i + 1][j] + dp[i][j + 1]
//                }
//            }
//        }
//        return dp[0][0]
        // 空间优化O(N)
        var dp = [Int](repeating: 0, count: n + 1)
        dp[n - 1] = 1
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                if obstacleGrid[i][j] == 1 {
                    dp[j] = 0
                } else {
                    dp[j] = dp[j] + dp[j + 1]
                }
            }
        }
        return dp[0]
    }
    
    // 递归实现，优化缓存，两种结束条件
    func uniquePathsWithObstacles_a(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        guard m != 0 else {
            return 0
        }
        let n = obstacleGrid[0].count
        
        var cache = Dictionary<String, Int>()
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i > m - 1 || j > n - 1 || obstacleGrid[i][j] == 1 {
                return 0
            }
            if i == m - 1 && j == n - 1 {
                return 1
            }
            if let item = cache["\(i)-\(j)"] {
                return item
            }
            let res = dfs(i+1, j) + dfs(i, j+1)
            cache["\(i)-\(j)"] = res
            return res
        }
        return dfs(0, 0)
    }
}
