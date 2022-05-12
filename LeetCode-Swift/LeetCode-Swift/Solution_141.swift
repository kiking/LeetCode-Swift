//
//  Solution_141.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/12.
//

import Foundation

/*
 141. 环形链表（简单）
 https://leetcode.cn/problems/linked-list-cycle/
 */

class Solution_141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        guard let first = head, let second = first.next else {
            return false
        }
        
        var slow = first, fast: ListNode? = second
        while let item = fast {
            if slow === item {
                return true
            }
            slow = slow.next!
            fast = fast?.next?.next
        }
        return false
    }
}
