//
//  Solution_98.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/10.
//

import Foundation

/*
 98. 验证二叉搜索树（中等）
 https://leetcode.cn/problems/validate-binary-search-tree/
 */

class Solution_98 {
    // 中序遍历非递归
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        
        var lastVisited: Int?
        var stack = [TreeNode]()
        
        var cur = root
        while cur != nil || stack.count != 0 {
            while cur != nil {
                stack.append(cur!)
                cur = cur!.left
            }
            
            let node = stack.removeLast()
            if let last = lastVisited, node.val <= last {
                return false
            } else {
                lastVisited = node.val
            }
            cur = node.right
        }
        return true
    }
    
    // 中序遍历递归
    func isValidBST_a(_ root: TreeNode?) -> Bool {
        var lastVisited = Int.min
        func helper(_ root: TreeNode?) -> Bool {
            guard let element = root else { return true }
            if !helper(element.left) {
                return false
            }
            if element.val <= lastVisited {
                return false
            }
            lastVisited = element.val
            return helper(element.right)
        }
        return helper(root)
    }
    
    // 分治
    func isValidBST_b(_ root: TreeNode?) -> Bool {
        func helper(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
            guard let element = root else { return true }
            if let val = min, element.val <= val {
                return false
            }
            if let val = max, element.val >= val {
                return false
            }
            return helper(element.left, min, element.val) && helper(element.right, element.val, max)
        }
        return helper(root, nil, nil)
    }
}
