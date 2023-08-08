//
//  NumberFormatter.swift
//  bootcamp
//
//  Created by Camila Storck on 06/12/2022.
//

import Foundation

public func numberFormatter() -> NumberFormatter {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    return formatter
}

public func formatToNumberString(_ text: String?) -> String {
    guard let text = text else { return "" }
    
    let formatter = numberFormatter()
    let completeString = text.replacingOccurrences(of: formatter.groupingSeparator, with: "")
    guard let value = Int(completeString) else { return "" }
    let formattedNumber = formatter.string(from: NSNumber(value: value)) ?? ""
    return formattedNumber
}

public func interestGained(for rate: Double, and amount: Int) -> Double {
    return rate * Double(amount)
}

public func finalAmount(for rate: Double, and amount: Int) -> Double {
    let interestGained = interestGained(for: rate, and: amount)
    return interestGained + Double(amount)
}
