//
//  Solution_35.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/19.
//

import Foundation

/*
 35. 搜索插入位置（简单）
 https://leetcode.cn/problems/search-insert-position/
 */

class Solution_35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if nums[mid] < target {
                start = mid
            } else {
                end = mid
            }
        }
        
        if nums[start] >= target {
            return start
        } else if nums[end] >= target {
            return end
        } else {
            return end + 1
        }
    }
}
