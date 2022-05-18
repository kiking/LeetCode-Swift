//
//  Solution_260.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/18.
//

import Foundation

/*
 260. 只出现一次的数字 III（中等）
 https://leetcode.cn/problems/single-number-iii/
 */

/**
有两个数只出现了一次记为 num1、num2 初始化为 0, 其余的数出现了两次,
我们可以对所有的数进行一次异或操作, 易知这个结果就等于 num1 和 num2
的异或结果(相同的数异或结果都为 0, 0和任意数异或结果都为那个数).
       
那么我可以考虑异或结果的某个非 0 位如最后一个非 0 位, 因为我们知道只
有当 num1、num2 在该位不一样的时候才会出现异或结果为 1. 所以我们以该
位是否为 1 对数组进行划分, 只要该位为 1 就和 num1 异或, 只要该位为 0
就和 num2 异或, 这样最终得到就是只出现过一次的两个数(其他在该位为 1 或
0 的数必然出现 0/2 次对异或结果无影响)
**/

class Solution_260 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let allORX = nums.reduce(0, ^)
        
        let diff = allORX & (-allORX) // -allRox是补码
        
        var x = 0
        nums.forEach { num in
            if (diff & num) == 0 {
                x ^= num
            }
        }
        
        /*
         根据：
         a=a^b
         b=a^b
         a=a^b
         求得另一个数字是allORX^x
         */
        return [x, allORX^x]
    }
    
    func test() {
        print(singleNumber([1,2,1,3,2,5]))
    }
}

