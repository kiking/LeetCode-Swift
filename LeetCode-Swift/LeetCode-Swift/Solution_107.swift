//
//  Solution_107.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/10.
//

import Foundation

/*
 107. 二叉树的层序遍历 II（中等）
 https://leetcode.cn/problems/binary-tree-level-order-traversal-ii/
 */

class Solution_107 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
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
        var result = levelOrder(root)
        result.reverse()
        return result
    }
}

