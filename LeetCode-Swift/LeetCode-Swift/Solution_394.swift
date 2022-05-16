//
//  Solution_394.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/13.
//

import Foundation

/*
 394. 字符串解码（中等）
 https://leetcode.cn/problems/decode-string/
 */

class Solution_394 {
    func decodeString(_ s: String) -> String {
        var stk = [String]()
        var index = 0
        while index < s.count {
            let item = s[s.index(s.startIndex, offsetBy: index)]
            if item.isNumber {
                var num = Int(String(item))!
                while true {
                    let nextItem = s[s.index(s.startIndex, offsetBy: index + 1)]
                    if nextItem.isNumber {
                        num = num * 10 + Int(String(nextItem))!
                        index += 1
                    } else {
                        break
                    }
                }
                stk.append(String(item))
            } else if item == "]" {
                var repeatedStr = ""
                var lastStr = stk.popLast()!
                while lastStr != "[" {
                    repeatedStr = lastStr + repeatedStr
                    lastStr = stk.popLast()!
                }
                let multipleNum = Int(stk.popLast()!)!
                var multipleStr = repeatedStr
                for _ in 1..<multipleNum {
                    multipleStr += repeatedStr
                }
                stk.append(multipleStr)
            } else {
                stk.append(String(item))
            }
            index += 1
        }
        return stk.joined()
    }
}
