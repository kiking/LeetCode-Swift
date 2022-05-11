//
//  Solution_206.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/11.
//

import Foundation

/*
 206. 反转链表（简单）
 https://leetcode.cn/problems/reverse-linked-list/
 */

class Solution_206 {
    // 双指针遍历
    func reverseList(_ head: ListNode?) -> ListNode? {
        var head = head
        var prev: ListNode?
        while let current = head {
            let next = current.next
            current.next = prev
            prev = head
            head = next
        }
        return prev
    }
    
    // 递归
    func reverseList_a(_ head: ListNode?) -> ListNode? {
        guard let current = head, let next = current.next else {
            return head
        }
        let reverse = reverseList_a(next)
        next.next = current
        current.next = nil
        return reverse
    }
}
