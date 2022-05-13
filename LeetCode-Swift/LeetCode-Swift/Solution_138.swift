//
//  Solution_138.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/12.
//

import Foundation

/*
 138. 复制带随机指针的链表（中等）
 https://leetcode.cn/problems/copy-list-with-random-pointer/
 */

// Definition for a Node.
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

class Solution_138 {
    // 迭代同步深拷贝
    func copyRandomList(_ head: Node?) -> Node? {
        var visited = [UnsafeMutableRawPointer: Node]()
        func clonedNode(_ old: Node?) -> Node? {
            guard let from = old else {
                return nil
            }
            let key = Unmanaged.passUnretained(from).toOpaque()
            if let item = visited[key] {
                return item
            }
            let new = Node(from.val)
            visited[key] = new
            return new
        }
        
        var oldCur = head
        var newCur: Node?
        while let old = oldCur {
            newCur = clonedNode(old)
            newCur?.next = clonedNode(old.next)
            newCur?.random = clonedNode(old.random)
            oldCur = old.next
        }
        return clonedNode(head)
    }
    
    // 深度遍历递归实现
    var visited = [UnsafeMutableRawPointer: Node]()
    func copyRandomList_a(_ head: Node?) -> Node? {
        guard let from = head else { return nil }
        
        let key = Unmanaged.passUnretained(from).toOpaque()
        if let item = visited[key] {
            return item
        }
        
        let copedItem = Node(from.val)
        visited[key] = copedItem
        copedItem.next = copyRandomList_a(from.random)
        copedItem.random = copyRandomList_a(from.random)
        
        return copedItem
    }
    
    // 复制节点跟在原节点后面
    func copyRandomList_b(_ head: Node?) -> Node? {
        guard head != nil else { return nil }
        
        var cur = head
        while let old = cur {
            let copied = Node(old.val)
            copied.next = old.next
            old.next = copied
            cur = copied.next
        }
        cur = head
        while let old = cur {
            old.next?.random = old.random?.next
            cur = old.next?.next
        }
        cur = head
        let copiedList = head?.next
        var pre: Node? = nil
        while let old = cur {
            pre?.next = old.next
            pre = old.next
            old.next = old.next?.next
            cur = old.next
        }
        return copiedList
    }
}

