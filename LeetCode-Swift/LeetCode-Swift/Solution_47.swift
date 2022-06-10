//
//  Solution_47.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/6/8.
//

import Foundation

/*
 47. 全排列 II（中等）
 https://leetcode.cn/problems/permutations-ii/
 */

class Solution_47 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let count = nums.count
        var used = [Int: Bool]()
        let sortedNums = nums.sorted()

        func backtrack(track: inout [Int]) {
            if track.count == count {
                res.append(track)
            }
            for (index, num) in sortedNums.enumerated() {
                if used[index] ?? false {
                    continue
                }

                // 优化：提前剪枝
                if index > 0 && sortedNums[index] == sortedNums[index - 1] && !(used[index - 1]!) {
                    continue
                }

                used[index] = true
                track.append(num)
                backtrack(track: &track)
                used[index] = false
                track.popLast()
            }
        }

        var items = [Int]()
        backtrack(track: &items)

        return res
    }
}
