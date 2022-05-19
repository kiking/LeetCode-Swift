//
//  Solution_190.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/19.
//

import Foundation

/*
 190. 颠倒二进制位（简单）
 https://leetcode.cn/problems/reverse-bits/
 */

class Solution_190 {
    func reverseBits(_ n: Int) -> Int {
        var num = n
        var res = 0
        var pow = 31
        while num != 0 {
            let bit = num&1
            res += bit << pow
            
            num = num >> 1
            pow -= 1
        }
        return res
    }
}
