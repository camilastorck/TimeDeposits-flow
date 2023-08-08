//
//  TimeDepositOptionsViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 19/12/2022.
//

import Foundation
import RxSwift

class TimeDepositOptionsViewModel {
    
    private let api: APIServiceProtocol
    
    init(api: APIServiceProtocol = APIService()) {
        self.api = api
    }
    
    func fetchData() -> Observable<[TimeDepositOption]> {
        let body: String = GraphQLQuery.timeDepositOptions.rawValue
        let query: [String : Any] = ["query" : body]
        let response: Observable<TimeDepositOptionsResponse> = api.getResponse(for: query)
        return response.map { $0.response.timeDepositOptions }
    }
    
    func createTimeDeposit(timeDeposit: TimeDepositOption, amount: Int, accountId: String, balance: Int) -> Observable<TimeDeposit> {
        guard amount <= balance else { return .error(CustomError.invalidAmount) }
        let graphQLMutation = GraphQLMutation(timeDepositOption: timeDeposit, originalAmount: amount, accountId: accountId)
        let mutation: [String : Any] = ["query" : "mutation \(graphQLMutation.query)"]
        let response: Observable<TimeDepositMutation> = api.getResponse(for: mutation)
        return response.map { $0.data.timeDeposit }
    }
}
