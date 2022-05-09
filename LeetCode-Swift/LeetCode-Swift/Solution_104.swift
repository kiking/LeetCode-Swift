//
//  Solution_104.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/9.
//

import Foundation

/*
 104. 二叉树的最大深度（简单）
 https://leetcode.cn/problems/maximum-depth-of-binary-tree/
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution_104 {
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
}
