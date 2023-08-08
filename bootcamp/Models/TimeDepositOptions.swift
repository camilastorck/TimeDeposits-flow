//
//  TimeDepositOptions.swift
//  bootcamp
//
//  Created by Camila Storck on 19/12/2022.
//

import Foundation

struct TimeDepositOptionsResponse: Decodable {
    let response: DataResponse
    
    enum CodingKeys: String, CodingKey {
        case response = "data"
    }
}

struct DataResponse: Decodable {
    let timeDepositOptions: [TimeDepositOption]
}

struct TimeDepositOption: Decodable {
    let currency: TimeDepositOptionCurrency
    let interestRate: Double
    let maxAmount, minAmount, minDays, maxDays: Int
    
    var maxAmountFormatted: Int {
        return maxAmount / 100
    }
    
    var minAmountFormatted: Int {
        return minAmount / 100
    }
    
    var percentageRate: Int {
        return Int(interestRate * 100)
    }
    
    var rateForDays: Double {
        return (interestRate / 365) * Double(maxDays)
    }
    
    var endDate: String {
        return maxDays.formatToFutureDate(.medium)
    }
    
    var maxDaysString: String {
        switch maxDays {
        case 30:
            return "1 mes"
        case 60:
            return "2 meses"
        case 90:
            return "3 meses"
        case 120:
            return "4 meses"
        case 150:
            return "5 meses"
        case 180:
            return "6 meses"
        case 365:
            return "1 año"
        default:
            return ""
        }
    }
}

