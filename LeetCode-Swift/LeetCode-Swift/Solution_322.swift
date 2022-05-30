//
//  Solution_322.swift
//  LeetCode-Swift
//
//  Created by 吴国权 on 2022/5/30.
//

import Foundation

/*
 322. 零钱兑换（中等）
 https://leetcode.cn/problems/coin-change/
 */

class Solution_322 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        
        // dp[i]为组成金额 i 所需最少的硬币数量
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for money in 1...amount {
            for coin in coins {
                if money - coin >= 0 {
                    dp[money] = min(dp[money], dp[money - coin] + 1)
                }
            }
        }
        
        return (dp[amount] == amount + 1) ? -1 : dp[amount]
    }
}
