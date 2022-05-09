//
//  Solution_78.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/9.
//

import Foundation

/*
 78.子集（中等）
 https://leetcode.cn/problems/subsets/
 */

class Solution_78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        func backtrack(start: Int, track: inout [Int]) {
            res.append(track)
            for index in start..<nums.count {
                track.append(nums[index])
                backtrack(start: index + 1, track: &track)
                track.popLast()
            }
        }
        
        var items = [Int]()
        backtrack(start: 0, track: &items)
        
        return res
    }
    
    func test() {
        print(subsets([1,2,3]))
    }
}
