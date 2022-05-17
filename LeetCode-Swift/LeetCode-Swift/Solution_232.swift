//
//  Solution_232.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/17.
//

import Foundation

/*
 232. 用栈实现队列（简单）
 https://leetcode.cn/problems/implement-queue-using-stacks/
 */

class Stack<Element> {
    var stack: [Element]
    
    var isEmpty: Bool { return stack.isEmpty }
    var peek: Element? { return stack.last }
    var size: Int { return stack.count }
    
    init() {
        stack = [Element]()
    }
    
    func push(object: Element) {
        stack.append(object)
    }
    
    func pop() -> Element? {
        return stack.popLast()
    }
    
}

class MyQueue {
    var leftStack: Stack<Int>
    var rightStack: Stack<Int>
    
    init() {
        leftStack = Stack()
        rightStack = Stack()
    }
    
    func push(_ x: Int) {
        rightStack.push(object: x)
    }
    
    func pop() -> Int {
        checkLeftStack()
        return leftStack.pop()!
    }
    
    func peek() -> Int {
        checkLeftStack()
        return leftStack.peek!
    }
    
    func empty() -> Bool {
        return rightStack.isEmpty && leftStack.isEmpty
    }
    
    private func checkLeftStack() {
        if leftStack.isEmpty {
            while !rightStack.isEmpty {
                leftStack.push(object: rightStack.pop()!)
            }
        }
    }
}
