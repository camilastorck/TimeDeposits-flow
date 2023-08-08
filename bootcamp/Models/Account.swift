//
//  Account.swift
//  bootcamp
//
//  Created by Camila Storck on 29/11/2022.
//

import Foundation

struct Account: Decodable {
    let balance: Int
    let currency: String
    let id: String
    let timeDeposits: [TimeDeposit]
    
    var formattedBalance: String {
        let formattedBalance: Double = Double(balance)
        return (formattedBalance / 100).formatToAmount
    }
}
