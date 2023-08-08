//
//  Double+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 27/12/2022.
//

import Foundation

extension Double {

    var formatToAmount: String {
        let number = NSNumber(value: self)
        let numberFormatter = numberFormatter()
        numberFormatter.decimalSeparator = ","
        numberFormatter.maximumFractionDigits = 2
        guard let formattedNumber = numberFormatter.string(from: number) else { return "" }
        return formattedNumber
    }
}
