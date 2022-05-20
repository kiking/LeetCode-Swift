//
//  Solution_153.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/20.
//

import Foundation

/*
 153. 寻找旋转排序数组中的最小值（中等）
 https://leetcode.cn/problems/find-minimum-in-rotated-sorted-array/
 */

class Solution_153 {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if nums[mid] > nums[end] {
                start = mid
            } else {
                end = mid
            }
        }
        
        return (nums[start] > nums[end]) ? nums[end] : nums[start]
    }
}
