//
//  Solution_704.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/19.
//

import Foundation

/*
 704. 二分查找（简单）
 https://leetcode.cn/problems/binary-search/
 */

class Solution_704 {
    // 二分模板3 (能找第一次/)
    func search(_ nums: [Int], _ target: Int) -> Int {
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
        if nums[start] == target {
            return start
        }
        if nums[end] == target {
            return end
        }
        return -1
    }
    
    // 二分模板1
    func search_a(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return -1
    }
}
