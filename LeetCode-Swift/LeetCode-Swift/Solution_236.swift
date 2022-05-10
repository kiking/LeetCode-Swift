//
//  Solution_236.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/9.
//

import Foundation

/*
 236. 二叉树的最近公共祖先（中等）
 https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/
 */

class Solution_236 {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let rootItem = root else { return nil }
        guard let pItem = p else { return q }
        guard let qItem = q else { return p }
        
        if rootItem === pItem || rootItem === qItem {
            return rootItem
        }
        let left = lowestCommonAncestor(rootItem.left, p, q)
        let right = lowestCommonAncestor(rootItem.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        if left != nil {
            return left
        }
        if right != nil {
            return right
        }
        return nil
    }
}
