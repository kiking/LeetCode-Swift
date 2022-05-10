//
//  Solution_83.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/10.
//

import Foundation

/*
 83. 删除排序链表中的重复元素（简单）
 https://leetcode.cn/problems/remove-duplicates-from-sorted-list/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution_83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        while let now = current, let next = now.next {
            if now.val == next.val {
                now.next = next.next
            } else {
                current = now.next
            }
        }
        return head
    }
}
