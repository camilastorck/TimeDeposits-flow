//
//  APIServiceResponse.swift
//  bootcamp
//
//  Created by Camila Storck on 29/11/2022.
//

import Foundation

struct APIServiceResponse: Decodable {
    let response: User
    
    enum CodingKeys: String, CodingKey {
        case response = "data"
        case user
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        self.response = try dataContainer.decode(User.self, forKey: .user)
    }
}

struct Response: Decodable {
    let user: User
}
