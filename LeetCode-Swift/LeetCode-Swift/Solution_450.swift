//
//  Solution_450.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/6/8.
//

import Foundation

/*
 450. 删除二叉搜索树中的节点（中等）
 https://leetcode.cn/problems/delete-node-in-a-bst/
 */

class Solution_450 {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil {
            return root
        }
        if root!.val < key {
            root?.right = deleteNode(root?.right, key)
        } else if root!.val > key {
            root?.left = deleteNode(root?.left, key)
        } else if root?.val == key {
            if root?.left == nil {
                return root?.right
            } else if root?.right == nil {
                return root?.left
            } else {
                var cur = root?.right
                while cur?.left != nil {
                    cur = cur?.left
                }
                cur?.left = root?.left
                return root?.right
            }
        }
        return root
    }
}
