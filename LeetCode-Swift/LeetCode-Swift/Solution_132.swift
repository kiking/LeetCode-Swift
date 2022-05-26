//
//  Solution_132.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/26.
//

import Foundation

/*
 132. 分割回文串 II（困难）
 https://leetcode.cn/problems/palindrome-partitioning-ii/
 */

func minCut_a(_ s: String) -> Int {
    let count = s.count

    if count <= 1{
        return 0
    }

    var dp = Array(0..<count)

    let sArray = Array(s)

    var checkPalindrome = Array(repeating: Array(repeating: false, count: count), count: count)
    for right in 0..<count {
        for left in 0...right {
            if sArray[left] == sArray[right] && ( right - left <= 2 || checkPalindrome[left + 1][right - 1] == true) {//0,1,2距离的都可以直接判断
                checkPalindrome[left][right] = true
            }
        }
    }

    for right in 0..<count {
        if checkPalindrome[0][right] {
            dp[right] = 0
            continue
        }
        for left in 0..<right {
            if checkPalindrome[left + 1][right] {
                dp[right] = min(dp[right], dp[left] + 1);
            }
        }
    }
    return dp[count - 1]
}

class Solution_132 {
    func minCut(_ s: String) -> Int {
        let count = s.count
        
        if count <= 1 {
            return 0
        }
        
        var dp = Array(0..<count)
        
        let sArray = Array(s)
        
        var checkPalindrome = Array(repeating: Array(repeating: false, count: count), count: count)
        for right in 0..<count {
            for left in 0...right {
                if sArray[left] == sArray[right] && (right - left <= 2 || checkPalindrome[left + 1][right + 1] == true) {
                    checkPalindrome[left][right] = true
                }
            }
        }
        
        for right in 0..<count {
            if checkPalindrome[0][right] {
                dp[right] = 0
                continue
            }
            for left in 0..<right {
                if checkPalindrome[left + 1][right] {
                    dp[right] = min(dp[right], dp[left] + 1)
                }
            }
        }
        return dp[count - 1]
    }
    
    func test() {
        let s = "aab"
        print(minCut(s))
    }
}
