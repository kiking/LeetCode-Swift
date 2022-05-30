//
//  Solution_24.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/30.
//

import Foundation

/*
 24. 两两交换链表中的节点（中等）
 https://leetcode.cn/problems/swap-nodes-in-pairs/
 */

class Solution_24 {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let item = head, let next = item.next else {
            return head
        }
        
        let nextNext = next.next
        next.next = item
        let new = swapPairs(nextNext)
        item.next = new
        return next
    }
}
