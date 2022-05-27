//
//  Solution_1143.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/27.
//

import Foundation

/*
 1143. 最长公共子序列（中等）
 https://leetcode.cn/problems/longest-common-subsequence/
 */

class Solution_1143 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let array1 = Array(text1)
        let array2 = Array(text2)
        
        var dp = Array(repeating: Array(repeating: 0, count: array2.count + 1), count: array1.count + 1)
        
        for i in 1...array1.count {
            for j in 1...array2.count {
                if array1[i - 1] == array2[j - 1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
        return dp[array1.count][array2.count]
    }
    
    func test() {
        let text1 = "abcde", text2 = "ace"
        print(longestCommonSubsequence(text1, text2))
    }
}
