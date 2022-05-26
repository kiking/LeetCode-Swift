//
//  Solution_45.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/25.
//

import Foundation

/*
 45. 跳跃游戏 II（中等）
 https://leetcode.cn/problems/jump-game-ii/
 */

class Solution_45 {
    // 贪心
    func jump(_ nums: [Int]) -> Int {
        let count = nums.count
        var maxPosition = 0 // 下一步的位置可到达的最远
        var step = 0
        var end = 0 // 当前位置可到达的最远
        for i in 0..<count-1 {
            maxPosition = max(maxPosition, nums[i] + i)
            if i == end {
                end = maxPosition
                step += 1
            }
            // 优化：提前结束
            if maxPosition >= count - 1 {
                if end < count - 1 {
                    step += 1
                }
                break
            }
        }
        return step
    }
    
    func test() {
        let nums = [2,3,1,1,4]
        print(jump(nums))
    }
}
