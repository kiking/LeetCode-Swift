//
//  Solution_82.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/11.
//

import Foundation

/*
 82. 删除排序链表中的重复元素 II（中等）
 https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii/
 */

class Solution_82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let top = ListNode(0)
        top.next = head
        var prev = top
        var current = head
        while let now = current, var next = now.next {
            if now.val == next.val {
                while let end = next.next {
                    if now.val == end.val {
                        next = end
                    } else {
                        break
                    }
                }
                prev.next = next.next
                current = next.next
            } else {
                prev = now
                current = next
            }
        }
        return top.next
    }
    
    // 递归
    func deleteDuplicates_a(_ head: ListNode?) -> ListNode? {
        var res = head
        if let current = res, let next = current.next {
            if current.val == next.val {
                var end: ListNode? = next
                while end != nil && current.val == end!.val {
                    end = end!.next
                }
                res = deleteDuplicates_a(end)
            } else {
                current.next = deleteDuplicates_a(next)
            }
        }
        return res
    }
}
