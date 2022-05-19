//
//  Solution_191.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/19.
//

import Foundation

/*
 191. 位1的个数(简单)
 https://leetcode.cn/problems/number-of-1-bits/
 */

class Solution_191 {
    /*
     在二进制表示中，数字 n 中最低位的 1总是对应 n - 1中的 0 。
     因此，将 n 和 n - 1与运算总是能把 n中最低位的 1 变成 0 ，并保持其他位不变。
     */
    func hammingWeight(_ n: Int) -> Int {
        var res = 0
        var i = n
        while i != 0 {
            i &= (i - 1)
            res += 1
        }
        return res
    }
}
