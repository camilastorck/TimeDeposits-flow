//
//  TimeDepositCellViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 15/12/2022.
//

import Foundation

struct TimeDepositCellViewModel {
    
    // MARK: - Strings
    
    let capitalToRecieveAmount: String
    let annualPercentageRate: String
    let endDateLabel: String
    
    // MARK: - Properties
    
    private let timeDeposit: TimeDeposit
    
    init(timeDeposit: TimeDeposit) {
        self.timeDeposit = timeDeposit
        
        capitalToRecieveAmount = "$ \(timeDeposit.returnAmount.formatToAmount)"
        annualPercentageRate = "\(timeDeposit.percentageRate)%"
        endDateLabel = timeDeposit.dueDate.formatToFullDateString
    }
}
