//
//  Solution_142.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/12.
//

import Foundation

/*
 142. 环形链表 II（中等）
 https://leetcode.cn/problems/linked-list-cycle-ii/
 */

class Solution_142 {
    // 2(a+b)=a+b+c+b => a=c
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                slow = head
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                return slow
            }
        }
        
        return nil
    }
}
