//
//  Solution_509.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/30.
//

import Foundation

/*
 509. 斐波那契数（简单）
 https://leetcode.cn/problems/fibonacci-number/
 */

class Solution_509 {
    func fib(_ n: Int) -> Int {
        var cache = Dictionary<Int, Int>()
        func helper(_ n: Int) -> Int {
            if n < 2 {
                return n
            }
            if let item = cache[n] {
                return item
            }
            let res = helper(n - 1) + helper(n - 2)
            cache[n] = res
            return res
        }
        
        return helper(n)
    }
}
