//
//  APIService.swift
//  bootcamp
//
//  Created by Camila Storck on 24/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

final class APIService: APIServiceProtocol {
    
    let userId: String = Bundle.main.userIdHOMO
    let path: String = Bundle.main.pathHOMO
    
    private func setPOSTRequest(with query: [String : Any]) -> Observable<Data> {
        guard let url = URL(string: path) else { return .error(APIError.invalidURL)}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(userId, forHTTPHeaderField: "userid")
        request.httpBody = try? JSONSerialization.data(withJSONObject: query, options: [])
        return URLSession.shared.rx.data(request: request)
    }
    
    func getResponse<T: Decodable>(for query: [String : Any]) -> Observable<T> {
        return setPOSTRequest(with: query)
            .decode(type: T.self, decoder: JSONDecoder())
    }
}
