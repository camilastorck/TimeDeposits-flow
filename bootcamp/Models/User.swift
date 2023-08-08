//
// APIServiceResponse.swift
//  bootcamp
//
//  Created by Camila Storck on 24/11/2022.
//

import Foundation

struct User: Decodable {
    let accounts: [Account]
}
