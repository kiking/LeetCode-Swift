//
//  Solution_28.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/9.
//

import Foundation

/*
 28.实现 strStr()（简单）
 https://leetcode.cn/problems/implement-strstr/
 */

class Solution_28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else {
            return 0
        }
        
        let haystackCount = haystack.count
        let needleCount = needle.count
        
        guard haystackCount >= needleCount else {
            return -1
        }
        
        let iRange = 0...(haystackCount - needleCount)
        
        for i in iRange {
            let startIndex = haystack.index(haystack.startIndex, offsetBy: i)
            let endIndex = haystack.index(startIndex, offsetBy: needleCount)
            let haystackRange = haystack[startIndex..<endIndex]
            
            if needle == haystackRange {
                return i
            } else {
                continue
            }
        }
        return -1
    }
    
    func test() {
        print(strStr("hello", "ll"))
    }
}
