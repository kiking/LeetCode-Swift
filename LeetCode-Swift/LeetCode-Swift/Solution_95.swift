//
//  Solution_95.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/30.
//

import Foundation

/*
 95. 不同的二叉搜索树 II（中等）
 https://leetcode.cn/problems/unique-binary-search-trees-ii/
 */

class Solution_95 {
    // 递归：利用一下搜索二叉树的性质。左子树的所有值小于根节点，右子树的所有值大于根节点
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n <= 0 else {
            return []
        }
        
        func helper(_ start: Int, _ end: Int) -> [TreeNode?] {
            if start > end {
                return [nil]
            }
            var trees = [TreeNode?]()
            for rootVal in start...end {
                let leftTrees = helper(start, rootVal - 1)
                let rightTrees = helper(rootVal + 1, end)
                
                for leftItem in leftTrees {
                    for rightItem in rightTrees {
                        let root = TreeNode(rootVal)
                        root.left = leftItem
                        root.right = rightItem
                        trees.append(root)
                    }
                }
            }
            return trees
        }
        
        return helper(1, n)
    }
}
