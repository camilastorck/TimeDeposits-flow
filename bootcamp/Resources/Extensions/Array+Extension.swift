//
//  Array+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 23/11/2022.
//

import Foundation

extension Array {
    
    func get(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}
