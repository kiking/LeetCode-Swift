//
//  Solution_46.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/6/8.
//

import Foundation

/*
 46. 全排列（中等）
 https://leetcode.cn/problems/permutations/
 */

class Solution_46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let count = nums.count
        var used = [Int: Bool]()
        
        func backtrack(track: inout [Int]) {
            if track.count == count {
                res.append(track)
            }
            for num in nums {
                if used[num] ?? false {
                    continue
                }
                used[num] = true
                track.append(num)
                backtrack(track: &track)
                used[num] = false
                track.popLast()
            }
        }
        var items = [Int]()
        backtrack(track: &items)

        return res
    }
    
    func test() {
        let nums = [1,2,3]
        print(permute(nums))
    }
}
