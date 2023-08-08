//
//  Currency.swift
//  bootcamp
//
//  Created by Camila Storck on 25/11/2022.
//

import Foundation

enum AccountCurrency: String {
    case ARS
    case USD
}

enum TimeDepositCurrency: String {
    case ARS
    case USD
    case UVA
}

enum TimeDepositOptionCurrency: String, Decodable {
    case ars = "ARS"
    case usd = "USD"
    case uva = "UVA"
}
