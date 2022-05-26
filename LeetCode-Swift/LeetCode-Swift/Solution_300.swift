//
//  Solution_300.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/26.
//

import Foundation

/*
 300. 最长递增子序列（中等）
 https://leetcode.cn/problems/longest-increasing-subsequence/
 */

func lengthOfLIS_PPP(_ nums: [Int]) -> Int {
    let count = nums.count
    if count <= 1 {
        return count
    }
    var dp = Array(repeating: 1, count: count)
    var res = 1;
    for i in 1..<count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                dp[i] = max(dp[i],dp[j] + 1)
            }
        }
        res = max(res,dp[i])
    }
    return res
}


class Solution_300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let count = nums.count
        if count <= 1 {
            return count
        }
        // 以nums[i]为结尾的最长递增子序列
        var dp = Array(repeating: 1, count: count)
        var res = 1
        for i in 1..<count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            res = max(res, dp[i])
        }
        return res
    }
    
    func test() {
        let nums = [1,3,6,7,9,4,10,5,6]
        print(lengthOfLIS(nums))
    }
}
