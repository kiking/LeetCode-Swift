//
//  Solution_84.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/17.
//

import Foundation

/*
 84. 柱状图中最大的矩形（困难）
 https://leetcode.cn/problems/largest-rectangle-in-histogram/
 */

class Solution_84 {
    // 单调栈
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let nums = heights.count
        if nums == 0 {
            return 0
        }
        var maxArea = 0
        var stack = [Int]()
        for i in 0..<nums {
            while !stack.isEmpty && heights[stack.last!] > heights[i] {
                let highest = heights[stack.popLast()!]
                // 下面这个while处理相等的，其实也可以不处理
                while !stack.isEmpty && heights[stack.last!] == highest {
                    stack.popLast()!
                }
                let width = stack.isEmpty ? i : (i - stack.last! - 1) // 栈为空的特殊情况处理
                maxArea = max(maxArea, highest * width)
            }
            stack.append(i)
        }

        // 遍历万后需要处理栈中剩余元素
        while !stack.isEmpty {
            let highest = heights[stack.popLast()!]
            // 下面这个while处理相等的，其实也可以不处理
            while !stack.isEmpty && heights[stack.last!] == highest {
                stack.popLast()!
            }
            let width = stack.isEmpty ? nums : (nums - stack.last! - 1) // 栈为空的特殊情况处理
            maxArea = max(maxArea, highest * width)
        }
        return maxArea
    }

    // 优化：单调栈+哨兵
    func largestRectangleArea_a(_ heights: [Int]) -> Int {
        if heights.count == 0 {
            return 0
        }

        let heights = [0] + heights + [0]
        let nums = heights.count
        
        var stack = [Int]()
        stack.append(heights[0])
        
        var maxArea = 0
        
        for i in 1..<nums {
            while heights[stack.last!] > heights[i] {
                let highest = heights[stack.popLast()!]
                let width = i - stack.last! - 1
                maxArea = max(maxArea, highest * width)
            }
            stack.append(i)
        }
        
        return maxArea
    }
    
    func test() {
        print(largestRectangleArea_a([2,1,5,6,2,3]))
    }
}
