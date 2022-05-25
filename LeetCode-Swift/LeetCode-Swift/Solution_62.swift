//
//  Solution_62.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/24.
//

import Foundation

/*
 62. 不同路径（中等）
 https://leetcode.cn/problems/unique-paths/
 */

class Solution_62 {
    // 动态规划
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
//        var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
//        dp[m][n - 1] = 1
//        for i in (0..<m).reversed() {
//            for j in (0..<n).reversed() {
//                dp[i][j] = dp[i + 1][j] + dp[i][j + 1]
//            }
//        }
//        return dp[0][0]
        // 空间优化O(N)
        var dp = [Int](repeating: 1, count: n + 1)
        for _ in (0..<m-1).reversed() { //从倒数第二行开始
            for j in (0..<n-1).reversed() { //从倒数第二列开始
                dp[j] = dp[j] + dp[j + 1]
            }
        }
        return dp[0]
    }
    
    // 自顶向下的递归，深度优先搜索，缓存已经被计算的值，终止条件最低边和最右边返回1
    func uniquePaths_a(_ m: Int, _ n: Int) -> Int {
        var cache = Dictionary<String, Int>()
        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == m - 1 || j == n - 1 {
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
