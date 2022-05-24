//
//  Solution_64.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/24.
//

import Foundation

/*
 64. 最小路径和（中等）
 https://leetcode.cn/problems/minimum-path-sum/
 */

class Solution_64 {
    // 动态规划（自底向上），空间优化O(N)
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        guard m != 0 else {
            return 0
        }
        let n = grid[0].count
        
        var dp = grid[m - 1]
        for i in (0..<(n - 1)).reversed() {
            dp[i] += dp[i+1]
        }
        dp.append(Int.max)  // dp长度是n+1
        
        for i in (0..<(m-1)).reversed() {
            for j in (0..<n).reversed() {
                dp[j] = min(dp[j], dp[j+1]) + grid[i][j]
            }
        }
        return dp[0]
    }

    // 自顶向下的递归，深度优先搜索，缓存已经被计算的值
    func minPathSum_a(_ grid: [[Int]]) -> Int {
        let m = grid.count
        guard m != 0 else {
            return 0
        }
        let n = grid[0].count
        
        var cache = Dictionary<String, Int>()
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == m || j == n {
                // m*n 的最后一个特殊处理：它的右边或下边为0
                if (i == m - 1) { // (i == m - 1) || (j == n - 1)
                    return 0
                }
                return Int.max
            }
            if let item = cache["\(i)-\(j)"] {
                return item
            }
            let res = min(dfs(i + 1, j), dfs(i, j + 1)) + grid[i][j]
            cache["\(i)-\(j)"] = res
            return res
        }
        return dfs(0, 0)
    }
    
    func test() {
        let grid = [[1,3,1],[1,5,1],[4,2,1]]
        print(minPathSum(grid))
    }
}
