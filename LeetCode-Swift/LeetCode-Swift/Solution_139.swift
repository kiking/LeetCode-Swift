//
//  Solution_139.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/26.
//

import Foundation

/*
 139. 单词拆分（中等）
 https://leetcode.cn/problems/word-break/
 */

class Solution_139 {
    // 动态规划
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordSet = Set<String>()
        var maxCount = 0
        var minCount = Int.max
        for item in wordDict {
            wordSet.insert(item)
            maxCount = max(maxCount, item.count)
            minCount = min(minCount, item.count)
        }
        
        let dpCount = s.count + 1
        var dp = Array(repeating: false, count: dpCount)
        dp[0] = true
        
        for i in 1..<dpCount {
            let left = max(i - maxCount, 0)
            let right = (i - minCount)
            if left > right {
                continue
            }
            for j in left...right {
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                let subStr = s[start..<end]
                if wordSet.contains(String(subStr)) && dp[j] {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[dpCount-1]
    }
    
    // 递归 缓存已处理过的值
    func wordBreak_a(_ s: String, _ wordDict: [String]) -> Bool {
        var cache = [String: Bool]()
        func check(_ str: String) -> Bool {
            guard str.count > 0 else {
                return true
            }
            if let temp = cache[str] {
                return temp
            }
            var flag = false
            for word in wordDict {
                if str.hasPrefix(word) {
                    if check(String(str.suffix(str.count - word.count))) {
                        flag = true
                        break
                    }
                }
            }
            cache[str] = flag
            return flag
        }
        return check(s)
    }
}
