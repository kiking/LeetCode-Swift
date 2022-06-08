//
//  Solution_110.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/9.
//

import Foundation

/*
 110. 平衡二叉树（简单）
 https://leetcode.cn/problems/balanced-binary-tree/
 */


//func isBalanced(_ root: TreeNode?) -> Bool {
//    guard let node = root else { return true }
//
//    if !isBalanced(node.left){
//        return false
//    }
//    if !isBalanced(node.right){
//        return false
//    }
//
//    let leftNum = maxDepth(node.left)
//    let rightNum  = maxDepth(node.right)
//
//    return (abs(leftNum - rightNum) <= 1)
//}

class Solution_110 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }

        let leftNum = maxDepth(node.left)
        let rightNum = maxDepth(node.right)
        
        if leftNum > rightNum {
            return leftNum + 1
        } else {
            return rightNum + 1
        }
    }

    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let node = root else { return true }

        if !isBalanced(node.left) {
            return false
        }
        if isBalanced(node.right) {
            return false
        }

        let leftNum = maxDepth(node.left)
        let rightNum = maxDepth(node.right)
        
        return abs(leftNum - rightNum) <= 1
    }
}

