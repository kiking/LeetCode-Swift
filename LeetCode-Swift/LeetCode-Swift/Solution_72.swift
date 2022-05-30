//
//  Solution_72.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/27.
//

import Foundation

/*
 72. 编辑距离（困难）
 https://leetcode.cn/problems/edit-distance/
 */

class Solution_72 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let array1 = Array(word1)
        let array2 = Array(word2)
        
        if array1.count == 0 || array2.count == 0 {
            return array1.count + array2.count
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: array2.count + 1), count: array1.count + 1)
        for row in 0...array1.count {
            dp[row][0] = row
        }
        for column in 0...array2.count {
            dp[0][column] = column
        }
        
        for i in 1...array1.count {
            for j in 1...array2.count {
                if array1[i - 1] == array2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1]
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                }
            }
        }

        return dp[array1.count][array2.count]
    }
}
