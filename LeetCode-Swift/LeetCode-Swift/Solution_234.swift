//
//  Solution_234.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/12.
//

import Foundation

/*
 234. 回文链表（简单）
 https://leetcode.cn/problems/palindrome-linked-list/
 */

class Solution_234 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return true }
        
        //快慢指针寻找中间节点,同时把前半部分反转
        var slow = head, fast = head
        var pre: ListNode? = nil
        while fast != nil && fast?.next != nil {
            let slowCur = slow
            slow = slow?.next
            fast = fast?.next?.next
            // 反转
            slowCur?.next = pre
            pre = slowCur
        }
        
        var head1 = pre // 第一段的头
        
        // 第二段的头
        var head2: ListNode? = slow
        if fast != nil { // head总数是奇数时，调整第二部分头节点
            head2 = slow?.next
        }
        
        while let cur1 = head, let cur2 = head2 {
            if cur1.val != cur2.val {
                return false
            }
            head1 = head1?.next
            head2 = head2?.next
        }
        
        return true
    }
}
