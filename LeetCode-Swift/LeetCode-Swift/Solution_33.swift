//
//  Solution_33.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/20.
//

import Foundation

/*
 33. 搜索旋转排序数组（中等）
 https://leetcode.cn/problems/search-in-rotated-sorted-array/
 */

class Solution_33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        } else if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        }
        
        var start = 0
        var end = nums.count - 1
        
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if nums[start] <= nums[mid] {
                if target <= nums[mid] && target >= nums[start] {
                    end = mid
                } else {
                    start = mid
                }
            } else {
                if target >= nums[mid] && target <= nums[end] {
                    start = mid
                } else {
                    end = mid
                }
            }
        }

        if nums[start] == target {
            return start
        } else if nums[end] == target {
            return end
        }

        return -1
    }
}
