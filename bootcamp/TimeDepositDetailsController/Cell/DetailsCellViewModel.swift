//
//  DetailsCellViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 15/12/2022.
//

import Foundation

struct DetailsCellViewModel {
    
    // MARK: - Strings
    
    let annualPercentageRate: String
    let amountLabel: String
    let endDateLabel: String
    let timeLabel: String
    
    // MARK: - Properties
    
    private let timeDepositOption: TimeDepositOption
    private let amount: Int
    
    init(timeDepositOption: TimeDepositOption, amount: Int) {
        self.timeDepositOption = timeDepositOption
        self.amount = amount
        
        let finalAmount = finalAmount(for: timeDepositOption.rateForDays, and: amount)
        annualPercentageRate = "\(timeDepositOption.percentageRate)%"
        amountLabel = "$ \(finalAmount.formatToAmount)"
        timeLabel = timeDepositOption.maxDaysString
        endDateLabel = "Finaliza \(timeDepositOption.endDate)"
    }
}
