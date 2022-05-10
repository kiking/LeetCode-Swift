//
//  Solution_102.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/10.
//

import Foundation

/*
 102. 二叉树的层序遍历（中等）
 https://leetcode.cn/problems/binary-tree-level-order-traversal/
 */

class Solution_102 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }
        var queue = [root!]
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
            res.append(level)
        }
        return res
    }
}
