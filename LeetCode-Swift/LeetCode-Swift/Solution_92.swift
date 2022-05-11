//
//  Solution_92.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/11.
//

import Foundation

/*
 92. 反转链表 II（中等）
 https://leetcode.cn/problems/reverse-linked-list-ii/
 */

class Solution_92 {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let sentry = ListNode(0)
        sentry.next = head
        var prev: ListNode? = sentry
        var cur: ListNode? = head
        for _ in 1..<left {
            prev = cur
            cur = cur?.next
        }
        
        let begin = prev // 记录反转第一个的前一个
        let end = cur // 记录反转的第一个
        
        for _ in left...right {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        
        begin?.next = prev
        end?.next = cur
        return sentry.next
    }
}
