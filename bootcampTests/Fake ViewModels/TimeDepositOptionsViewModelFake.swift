//
//  TimeDepositOptionsViewModelFake.swift
//  bootcampTests
//
//  Created by Camila Storck on 28/12/2022.
//

import Foundation
import RxSwift
@testable import bootcamp

class TimeDepositOptionsViewModelFake: TimeDepositOptionsViewModel {
    
    var response: [TimeDepositOption]!
    
    override func fetchData() -> Observable<[TimeDepositOption]> {
        return .just(response)
    }
}
