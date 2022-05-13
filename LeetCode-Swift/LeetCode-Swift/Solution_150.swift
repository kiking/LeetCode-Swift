//
//  Solution_150.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/13.
//

import Foundation

/*
 150. 逆波兰表达式求值（中等）
 https://leetcode.cn/problems/evaluate-reverse-polish-notation/
 */

class Solution_150 {
    func evalRPN(_ tokens: [String]) -> Int {
        var values = [Int]()
        for item in tokens {
            switch item {
            case "+":
                if let x = values.popLast(), let y = values.popLast() {
                    values.append(y + x)
                }
            case "-":
                if let x = values.popLast(), let y = values.popLast() {
                    values.append(y - x)
                }
            case "*":
                if let x = values.popLast(), let y = values.popLast() {
                    values.append(y * x)
                }
            case "/":
                if let x = values.popLast(), let y = values.popLast() {
                    values.append(y / x)
                }
            default:
                values.append(Int(item)!)
            }
        }
        return values.popLast()!
    }
}
