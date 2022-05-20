//
//  Solution_74.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/20.
//

import Foundation

/*
 74. 搜索二维矩阵（中等）
 https://leetcode.cn/problems/search-a-2d-matrix/
 */

class Solution_74 {
    // m*n矩阵可以视为长度为m*n的有序数组来进行二分查找
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        if m == 0 {
            return false
        }
        let n = matrix[0].count
        if n == 0 {
            return false
        }
        var start = 0
        var end = m * n - 1
        
        while start <= end {
            let mid = start + (end - start) / 2
            let midValue = matrix[mid/n][mid%n]
            if target == midValue {
                return true
            } else if target > midValue {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
        return false
    }
}
