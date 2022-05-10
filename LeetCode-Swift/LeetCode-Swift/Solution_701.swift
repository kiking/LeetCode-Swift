//
//  Solution_701.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/10.
//

import Foundation

/*
 701. 二叉搜索树中的插入操作（中等）
 https://leetcode.cn/problems/insert-into-a-binary-search-tree/
 */

class Solution_701 {
    // DFS
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let element = root else {
            let node = TreeNode(val)
            return node
        }
        
        if val > element.val {
            element.right = insertIntoBST(element.right, val)
        } else {
            element.left = insertIntoBST(element.left, val)
        }
        
        return element
    }
}
