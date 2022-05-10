//
//  Solution_103.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/10.
//

import Foundation

/*
 103. 二叉树的锯齿形层序遍历（中等）
 https://leetcode.cn/problems/binary-tree-zigzag-level-order-traversal/
 */

class Solution_103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var queue = [root!]
        var levelIndex = 0
        var res = [[Int]]()
            
        while !queue.isEmpty {
            let count = queue.count
            var level = [Int]()
            for _ in 0..<count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append((levelIndex & 1 == 0) ? level : level.reversed())
            levelIndex += 1
        }
        return res
    }
}
