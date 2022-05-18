//
//  Solution_542.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/17.
//

import Foundation

/*
 542. 01 矩阵（中等）
 https://leetcode.cn/problems/01-matrix/
 */

class Solution_542 {
    // DP
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        let rowCount = mat.count
        let columCount = mat[0].count
        var res = mat
        for (x, row) in mat.enumerated() {
            for (y, item) in row.enumerated() {
                res[x][y] = (item == 0) ? 0 : 10000
            }
        }
        
        for x in 0..<rowCount {
            for y in 0..<columCount {
                if x - 1 >= 0 {
                    res[x][y] = min(res[x][y], res[x-1][y]+1)
                }
                if y - 1 >= 0 {
                    res[x][y] = min(res[x][y], res[x][y-1]+1)
                }
            }
        }
        
        for x in (0..<rowCount).reversed() {
            for y in (0..<columCount).reversed() {
                if x + 1 < rowCount {
                    res[x][y] = min(res[x][y], res[x+1][y]+1)
                }
                if y + 1 < columCount {
                    res[x][y] = min(res[x][y], res[x][y+1]+1)
                }
            }
        }
        
        return res
    }
    
    // BFS
    func updateMatrix_a(_ mat: [[Int]]) -> [[Int]] {
        let rowCount = mat.count
        let columnCount = mat[0].count
        var queue = [(Int, Int)]()
        var res = mat
        for (x, row) in mat.enumerated() {
            for (y, item) in row.enumerated() {
                if item == 0 {
                    queue.append((x,y))
                } else {
                    res[x][y] = -1
                }
            }
        }
        
        while !queue.isEmpty {
            let point: (x: Int, y: Int) = queue.removeFirst()
            for item: (x: Int, y: Int) in [(0,-1),(0,1),(-1,0),(1,0)] {
                let x = point.x + item.x
                let y = point.y + item.y
                if x >= 0 && x < rowCount && y >= 0 && y < columnCount && res[x][y] == -1 {
                    res[x][y] = res[point.x][point.y] + 1
                    queue.append((x, y))
                }
            }
        }
        return res
    }
}
