//
//  Solution_344.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/30.
//

import Foundation

/*
 344. 反转字符串（简单）
 https://leetcode.cn/problems/reverse-string/
 */

class Solution_344 {
    func reverseString(_ s: inout [Character]) {
        func helper(_ s: inout [Character], _ left: Int, _ right: Int) {
            if left >= right {
                return
            }
            (s[left], s[right]) = (s[right], s[left])
            helper(&s, left + 1, right - 1)
        }
        
        helper(&s, 0, s.count - 1)
    }
}
