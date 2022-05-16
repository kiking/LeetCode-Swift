//
//  Solution_133.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/16.
//

import Foundation

/*
 133. 克隆图（中等）
 https://leetcode.cn/problems/clone-graph/
 */

public class GNode {
    public var val: Int
    public var neighbors: [GNode?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution_133 {
    func cloneGraph(_ node: GNode?) -> GNode? {
        var visited = [Int: GNode?]()
        func dfs(_ node: GNode?) -> GNode? {
            guard let current = node else { return nil }
            
            if let visitedItem = visited[current.val] {
                return visitedItem
            }
            
            let clonedNode = GNode(current.val)
            visited[clonedNode.val] = clonedNode
            
            for neighbor in current.neighbors {
                clonedNode.neighbors.append(dfs(neighbor))
            }
            
            return clonedNode
        }
        
        return dfs(node)
    }
}

