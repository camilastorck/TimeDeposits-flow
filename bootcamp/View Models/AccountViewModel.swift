//
//  AccountViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 28/11/2022.
//

import Foundation
import RxSwift

class AccountViewModel {
    
    private let api: APIServiceProtocol
    
    init(api: APIServiceProtocol = APIService()) {
        self.api = api
    }
    
    func fetchData() -> Observable<[Account]> {
        let body: String = GraphQLQuery.user.rawValue
        let query: [String : Any] = ["query" : body]
        let response: Observable<APIServiceResponse> = api.getResponse(for: query)
        return response.map { $0.response.accounts }
    }
}
