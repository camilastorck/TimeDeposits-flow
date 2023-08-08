//
//  String+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 23/11/2022.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "\(self)_comment")
    }
    
    var formatToFullDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self)
        let dateToFullDateString: String? = date?.format(style: .long)
        
        guard let fullDateString = dateToFullDateString else { return "" }
        return fullDateString
    }
    
    var formatToInt: Int {
        let formattedAmount: String = self.replacingOccurrences(of: ".", with: "")
        return (formattedAmount as NSString).integerValue
    }
}
