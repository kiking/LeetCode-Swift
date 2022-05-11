//
//  Solution_86.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/11.
//

import Foundation

/*
 86. 分隔链表（中等）
 https://leetcode.cn/problems/partition-list/
 */

class Solution_86 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let lessList = ListNode(0) // 小于x的链表
        var lessTail = lessList // 小于x的链表的尾部
        
        let res = ListNode(0) // 原始链表的哨兵
        res.next = head
        var prev = res
        var cur = head
        
        while let item = cur {
            if item.val < x {
                prev.next = item.next
                lessTail.next = item
                lessTail = item
            } else {
                prev = item
            }
            cur = item.next
        }
        
        lessTail.next = res.next
        return lessTail.next
    }
}
