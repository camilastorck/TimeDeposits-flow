//
//  Date+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 23/11/2022.
//

import Foundation

extension Date {
    
    func format(style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "d MMMM yyyy"
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
}
