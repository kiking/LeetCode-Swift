//
//  Solution_3.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/6/7.
//

import Foundation

/*
 3. 无重复字符的最长子串（中等）
 https://leetcode.cn/problems/longest-substring-without-repeating-characters/
 */

class Solution_3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArray = [Character](s)

        var win = Dictionary<Character, Int>()

        var left = 0, right = 0    // 窗口
        var maxLength = 0

        while right < sArray.count {
            let rightItem = sArray[right]
            right += 1
            win[rightItem, default: 0] += 1
            while win[rightItem]! > 1 {
                let leftItem = sArray[left]
                left += 1
                win[leftItem]! -= 1
            }
            maxLength = max(maxLength, right - left)
        }

        return maxLength
    }
}
