//
//  Bundle+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 24/11/2022.
//

import Foundation

extension Bundle {
    
    var userIdHOMO: String {
        guard let userId = object(forInfoDictionaryKey: "userIdHOMO") as? String else { return "" }
        return userId
    }
    
    var pathHOMO: String {
        guard let url = object(forInfoDictionaryKey: "pathHOMO") as? String else { return "" }
        return url
    }
}
