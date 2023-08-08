//
//  TimeDepositOptionsFake.swift
//  bootcampTests
//
//  Created by Camila Storck on 29/12/2022.
//

import Foundation
@testable import bootcamp

struct TimeDepositOptionsFake {
    
    let timeDepositOption = TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 500000, minAmount: 50000, minDays: 1, maxDays: 30)
    
    let timeDepositOptions = [
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 500000, minAmount: 50000, minDays: 1, maxDays: 30),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 500000, minAmount: 50000, minDays: 31, maxDays: 60),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 500000, minAmount: 50000, minDays: 61, maxDays: 90),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 500000, minAmount: 50000, minDays: 91, maxDays: 120),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 500000, minAmount: 50000, minDays: 121, maxDays: 150),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 500000, minAmount: 50000, minDays: 151, maxDays: 180),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 500000, minAmount: 50000, minDays: 181, maxDays: 365),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 1000000, minAmount: 500001, minDays: 1, maxDays: 30),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 1000000, minAmount: 500001, minDays: 31, maxDays: 60),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.4, maxAmount: 1000000, minAmount: 500001, minDays: 61, maxDays: 90),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 1000000, minAmount: 500001, minDays: 91, maxDays: 120),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 1000000, minAmount: 500001, minDays: 121, maxDays: 150),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 1000000, minAmount: 500001, minDays: 151, maxDays: 180),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.36, maxAmount: 1000000, minAmount: 500001, minDays: 181, maxDays: 365),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.41, maxAmount: 5000000, minAmount: 1000001, minDays: 1, maxDays: 30),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.41, maxAmount: 5000000, minAmount: 1000001, minDays: 31, maxDays: 60),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.41, maxAmount: 5000000, minAmount: 1000001, minDays: 61, maxDays: 90),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 5000000, minAmount: 1000001, minDays: 91, maxDays: 120),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 5000000, minAmount: 1000001, minDays: 121, maxDays: 150),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 5000000, minAmount: 1000001, minDays: 151, maxDays: 180),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 5000000, minAmount: 1000001, minDays: 181, maxDays: 365),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 10000000, minAmount: 5000001, minDays: 1, maxDays: 30),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 10000000, minAmount: 5000001, minDays: 31, maxDays: 60),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.42, maxAmount: 10000000, minAmount: 5000001, minDays: 61, maxDays: 90),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 10000000, minAmount: 5000001, minDays: 91, maxDays: 120),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 10000000, minAmount: 5000001, minDays: 121, maxDays: 150),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 10000000, minAmount: 5000001, minDays: 151, maxDays: 180),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 10000000, minAmount: 5000001, minDays: 181, maxDays: 365),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 1, maxDays: 30),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 31, maxDays: 60),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 61, maxDays: 90),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 91, maxDays: 120),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 121, maxDays: 150),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 151, maxDays: 180),
        TimeDepositOption(currency: TimeDepositOptionCurrency.ars, interestRate: 0.38, maxAmount: 99999999999999904, minAmount: 10000001, minDays: 181, maxDays: 365),
        TimeDepositOption(currency: TimeDepositOptionCurrency.usd, interestRate: 0.28, maxAmount: 99999999999999904, minAmount: 5000, minDays: 1, maxDays: 340),
        TimeDepositOption(currency: TimeDepositOptionCurrency.uva, interestRate: 0.2, maxAmount: 99999999900, minAmount: 50000, minDays: 1, maxDays: 365)
    ]
}
