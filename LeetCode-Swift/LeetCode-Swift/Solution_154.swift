//
//  Solution_154.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/20.
//

import Foundation

/*
 154. 寻找旋转排序数组中的最小值 II（困难）
 https://leetcode.cn/problems/find-minimum-in-rotated-sorted-array-ii/comments/
 */

class Solution_154 {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while start + 1 < end {
            while start + 1 < end {
                if nums[start] == nums[start + 1] {
                    start += 1
                } else {
                    break
                }
            }
            while end - 1 > start {
                if nums[end] == nums[end - 1] {
                    end -= 1
                } else {
                    break
                }
            }
            let mid = start + (end - start) / 2
            if nums[mid] > nums[end] {
                start = mid
            } else {
                end = mid
            }
        }

        return nums[start] > nums[end] ? nums[end] : nums[start]
    }
}
