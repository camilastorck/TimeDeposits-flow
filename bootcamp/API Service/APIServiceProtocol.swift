//
//  ServiceProtocol.swift
//  bootcamp
//
//  Created by Camila Storck on 27/11/2022.
//

import Foundation
import RxSwift

protocol APIServiceProtocol {
    var userId: String { get }
    var path: String { get }
    func getResponse<T: Decodable>(for query: [String : Any]) -> Observable<T>
}
