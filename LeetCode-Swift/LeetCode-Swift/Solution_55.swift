//
//  Solution_55.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/25.
//

import Foundation

/*
 55. 跳跃游戏（中等）
 https://leetcode.cn/problems/jump-game/
 */

class Solution_55 {
    // 从前往后 贪心
    func canJump(_ nums: [Int]) -> Bool {
        let count = nums.count
        var distance = 0
        for i in 0..<count {
            guard i <= distance else {
                return false
            }
            distance = max(distance, nums[i] + i)
            if distance >= count - 1 {
                return true
            }
        }
        return true
    }
    
    // 从后往前 动态规划
    func canJump_a(_ nums: [Int]) -> Bool {
        let count = nums.count
        var endIndex = count - 1 // 能够跳到结尾的最小位置
        for i in (0..<count-1).reversed() {
            if i + nums[i] >= endIndex {
                endIndex = min(endIndex, i)
            }
        }
        return endIndex == 0
    }
    
    func test() {
        let nums = [2,3,1,1,4]
        print(canJump_a(nums))
    }
}
