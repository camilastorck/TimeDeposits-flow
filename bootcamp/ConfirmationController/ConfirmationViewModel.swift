//
//  ConfirmationViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//
import Foundation

struct ConfirmationViewModel {
    
    // MARK: - Strings
    
    let amountLabel: String
    let startDateLabel: String
    let endDateLabel: String
    let investedAmountLabel: String
    let interestGainedAmountLabel: String
    let TNAAmountLabel: String
    
    // MARK: - Properties
    
    private let timeDepositOption: TimeDepositOption
    private let amount: Int
    
    init(timeDepositOption: TimeDepositOption, amount: Int) {
        self.timeDepositOption = timeDepositOption
        self.amount = amount
        
        let interestGained = interestGained(for: timeDepositOption.rateForDays, and: amount)
        let finalAmount = finalAmount(for: timeDepositOption.rateForDays, and: amount)
        amountLabel = "$ \(finalAmount.formatToAmount)"
        startDateLabel = "\(Date().format(style: .medium))"
        endDateLabel = timeDepositOption.endDate
        investedAmountLabel = "$ \(amount.formatToAmount)"
        interestGainedAmountLabel = "$ \(interestGained.formatToAmount)"
        TNAAmountLabel = "\(timeDepositOption.percentageRate)%"
    }
}
