//
//  Solution_90.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/6/8.
//

import Foundation

/*
 90. 子集 II（中等）
 https://leetcode.cn/problems/subsets-ii/
 */

class Solution_90 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let sortedNums = nums.sorted()

        func backtrack(start: Int, track: inout [Int]) {
            res.append(track)
            for index in start..<sortedNums.count {
                if index > start && sortedNums[index] == sortedNums[index - 1] {
                    continue
                }
                track.append(sortedNums[index])
                backtrack(start: index+1, track: &track)
                track.popLast()
            }
        }

        var items = [Int]()
        backtrack(start: 0, track: &items)

        return res
    }
    
    func test() {
        let nums = [1,2,2]
        print(subsetsWithDup(nums))
    }
}
