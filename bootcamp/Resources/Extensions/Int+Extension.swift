//
//  Int+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 01/12/2022.
//

import Foundation

extension Int {
    
    var formatToAmount: String {
        let number = NSNumber(value: self)
        let numberFormatter = numberFormatter()
        numberFormatter.decimalSeparator = ","
        guard let formattedNumber = numberFormatter.string(from: number) else { return "" }
        return formattedNumber
    }
    
    func formatToFutureDate(_ style: DateFormatter.Style) -> String {
        guard let futureDate = Calendar.current.date(byAdding: .day, value: self, to: Date()) else { return "" }
        return futureDate.format(style: style)
    }
}
