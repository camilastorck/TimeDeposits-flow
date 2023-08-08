//
//  GraphQLQuery.swift
//  bootcamp
//
//  Created by Camila Storck on 22/12/2022.
//

import Foundation

enum GraphQLQuery: String {
    case user = "{ user { accounts { id timeDeposits }}}"
    case timeDepositOptions = "{ timeDepositOptions { interestRate maxAmount maxDays minAmount minDays }}"
}

struct GraphQLMutation {
    
    let timeDepositOption: TimeDepositOption
    let originalAmount: Int
    let accountId: String
    let query: String
    
    init(timeDepositOption: TimeDepositOption, originalAmount: Int, accountId: String) {
        self.timeDepositOption = timeDepositOption
        self.originalAmount = originalAmount
        self.accountId = accountId
        query = "{ timeDeposit(originalAmount: \(originalAmount), accountId: \(accountId), days: \(timeDepositOption.maxDays), currency: \(timeDepositOption.currency.rawValue), interestRate: \(timeDepositOption.interestRate)) { id active } }"
    }
}
