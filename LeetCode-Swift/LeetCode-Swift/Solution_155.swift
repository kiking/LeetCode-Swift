//
//  Solution_155.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/13.
//

import Foundation

/*
 155. 最小栈（简单）
 https://leetcode.cn/problems/min-stack/
 */

class MinStack {
    private var stack: [Int]
    private var minStack: [Int]

    init() {
        stack = [Int]()
        minStack = [Int]()
    }

    func push(_ val: Int) {
        stack.append(val)
        guard let min = minStack.last, min < val else {
            minStack.append(val)
            return
        }
    }

    func pop() {
        if let last = stack.popLast() {
            if let min = minStack.last, min >= last {
                minStack.popLast()
            }
        }
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
}
