//
//  Solution_124.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/9.
//

import Foundation

/*
 124. 二叉树中的最大路径和（困难）
 https://leetcode.cn/problems/binary-tree-maximum-path-sum/
 */

class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var pathMax = Int.min
        
        func dfs(_ root: TreeNode?) -> Int {
            guard let element = root else { return 0 }
            
            let leftMax = dfs(element.left)
            let rightMax = dfs(element.right)
            
            pathMax = max(pathMax, leftMax + rightMax + element.val)
            
            return max(max(leftMax, rightMax) + element.val, 0)
        }
        
        dfs(root)
        return pathMax
    }
}
