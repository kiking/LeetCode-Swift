//
//  Solution_94.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/16.
//

import Foundation

/*
 94. 二叉树的中序遍历（简单）
 https://leetcode.cn/problems/binary-tree-inorder-traversal/
 */

class Solution_94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode]()
        var current = root
        while current != nil || !stack.isEmpty {
            while current != nil {
                stack.append(current!)
                current = current!.left
            }
            current = stack.popLast()!
            res.append(current!.val)
            current = current!.right
        }
        return res
    }
}
