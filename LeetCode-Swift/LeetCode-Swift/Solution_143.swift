//
//  Solution_143.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/12.
//

import Foundation

/*
 143. 重排链表（中等）
 https://leetcode.cn/problems/reorder-list/
 */

class Solution_143 {
    func reorderList(_ head: ListNode?) {
        guard head != nil && head!.next != nil else {
            return
        }
        // 快慢指针寻找中间节点
        var slow = head!, fast = head!
        while fast.next != nil && fast.next!.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }
        var head2 = slow.next
        slow.next = nil
        
        // 后半段反转
        var pre: ListNode? = nil
        while let cur = head2 {
            let next = cur.next
            cur.next = pre
            pre = cur
            head2 = next
        }
        head2 = pre
        
        // 拼接
        let dummy = ListNode(0)
        
        var cur = dummy
        var h1 = head, h2 = head2
        while h2 != nil {
            cur.next = h1
            
            let next1 = h1?.next
            h1?.next = h2
            h1 = next1
            
            cur = h2!
            h2 = h2?.next
        }
        cur.next = h1 // 奇数时h1还有一个，偶数时是nil（是nil时也不影响）
        
        dummy.next = nil
    }
}
