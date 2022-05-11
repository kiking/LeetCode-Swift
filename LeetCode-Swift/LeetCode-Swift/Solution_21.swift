//
//  Solution_21.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/11.
//

import Foundation

/*
 21. 合并两个有序链表（简单）
 https://leetcode.cn/problems/merge-two-sorted-lists/
 */

class Solution_21 {
    // 递归
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let res = ListNode(0)
        guard let cur1 = list1 else {
            return list2
        }
        guard let cur2 = list2 else {
            return list1
        }
        if cur1.val < cur2.val {
            res.next = cur1
            let next = mergeTwoLists(cur1.next, cur2)
            cur1.next = next
        } else {
            res.next = cur2
            let next = mergeTwoLists(cur1, cur2.next)
            cur2.next = next
        }
        return res.next
    }
    
    // 迭代
    func mergeTwoLists_a(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1, l2 = list2
        let res = ListNode(0)
        var current = res
        while let cur1 = l1, let cur2 = l2 {
            if cur1.val < cur2.val {
                current.next = cur1
                l1 = cur1.next
            } else {
                current.next = cur2
                l2 = cur2.next
            }
            current = current.next!
        }
        current.next = l1 ?? l2
        return res.next
    }
}
