//
//  APIServiceError.swift
//  bootcamp
//
//  Created by Camila Storck on 28/11/2022.
//

import Foundation

enum APIError: String, Error {
    case invalidURL = "APIError.InvalidURL"
    case failedRequest = "APIError.FailedRequest"
    case failedDataResponse = "APIError.FailedDataResponse"
    case failedToDecode = "APIError.FailedToDecode"
}

enum CustomError: Error {
    case invalidAmount
}
