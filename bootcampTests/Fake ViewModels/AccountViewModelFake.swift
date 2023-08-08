//
//  AccountViewModelFake.swift
//  bootcampTests
//
//  Created by Camila Storck on 29/12/2022.
//

import XCTest
import RxSwift
@testable import bootcamp

class AccountViewModelFake: AccountViewModel {
    
    var response: [Account]!
    var fetchDataCalled: Bool = false
    
    override func fetchData() -> Observable<[Account]> {
        fetchDataCalled = true
        return .just(response)
    }
}
