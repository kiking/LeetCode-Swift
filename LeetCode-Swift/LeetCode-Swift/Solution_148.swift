//
//  Solution_148.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/11.
//

import Foundation

/*
 148. 排序链表（中等）
 https://leetcode.cn/problems/sort-list/
 */

/*
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 思路：归并排序，找中点和合并操作
 链表的递归函数调用空间复杂度：O(logn)，所以必须使用非递归
 */
class Solution_148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let item = head, item.next != nil else {
            return head
        }
        
        var count = 0
        var cur = head
        
        while cur != nil {
            count += 1
            cur = cur?.next
        }
        
        let dummy = ListNode(1)
        dummy.next = head
        
        // 从长度为1个元素开始合并
        var length = 1
        while length < count {
            var begin = dummy
            var index = 0
            // 遍历合并长度为length
            while index + length < count {
                var first = begin.next!, second: ListNode? = first
                var firstCount = length, secondCount = length
                // 计算第二块的起始位置
                for _ in 0..<length {
                    second = second?.next
                }
                
                // 合并
                while firstCount > 0 && secondCount > 0 && second != nil {
                    if first.val < second!.val {
                        begin.next = first
                        first = first.next!
                        firstCount -= 1
                    } else {
                        begin.next = second
                        second = second?.next
                        secondCount -= 1
                    }
                    
                    begin = begin.next!
                }
                
                //第一块还有剩余
                while firstCount > 0 {
                    begin.next = first
                    first = first.next!
                    firstCount -= 1
                    begin = begin.next!
                }
                
                //第二块还有剩余
                while secondCount > 0 && second != nil {
                    begin.next = second
                    second = second!.next
                    secondCount -= 1
                    begin = begin.next!
                }
                
                begin.next = second //指向下次合并块的开始位置
                
                index += 2 * length
            }
            length = 2 * length
        }
        return dummy.next
    }
}
