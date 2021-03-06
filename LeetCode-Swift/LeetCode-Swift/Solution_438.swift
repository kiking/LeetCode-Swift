//
//  Solution_438.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/6/7.
//

import Foundation

/*
 438. 找到字符串中所有字母异位词（中等）
 https://leetcode.cn/problems/find-all-anagrams-in-a-string/
 */

class Solution_438 {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sArray = [Character](s)
        
        var win = [Character: Int]()    // 保存滑动窗口字符集
        var need = [Character: Int]()   // 保存需要的字符集
        
        for c in p {
            need[c, default: 0] += 1
        }
        
        var left = 0, right = 0 // 窗口
        var match = 0     // match匹配次数
        var startIndexs = [Int]()
        
        while right < sArray.count {
            let rightItem = sArray[right]
            right += 1
            // 在需要的字符集里面，添加到窗口字符集里面
            if let needItem = need[rightItem] {
                win[rightItem, default: 0] += 1
                // 如果当前字符的数量匹配需要的字符的数量，则match值+1
                if win[rightItem] == needItem {
                    match += 1
                }
            } else {
                continue
            }
            
            while match == need.count {
                if right - left == p.count {
                    startIndexs.append(left)
                }
                
                let leftItem = sArray[left]
                left += 1
                if let needItem = need[leftItem] {
                    if win[leftItem] == needItem {
                        match -= 1
                    }
                    win[leftItem]! -= 1
                }
            }
        }
        return startIndexs
    }
}
