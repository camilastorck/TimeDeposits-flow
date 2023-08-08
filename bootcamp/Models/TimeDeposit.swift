//
//  TimeDeposit.swift
//  bootcamp
//
//  Created by Camila Storck on 29/11/2022.
//

import Foundation

struct TimeDepositMutation: Decodable {
    let data: TimeDepositMutationResponse
}

struct TimeDepositMutationResponse: Decodable {
    let timeDeposit: TimeDeposit
}

struct TimeDeposit: Decodable {
    let active: Bool
    let dueDate: String
    let id: String
    let interestRate: Double
    let originalAmount: Int
    let returnAmount: Int
    let startDate: String
    
    var percentageRate: Int {
        return Int(interestRate * 100)
    }
}
