//
//  TimeDepositsViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import UIKit
import RxSwift

struct TimeDepositsViewModel {
    
    // MARK: - Properties
    
    private let accountVM: AccountViewModel = AccountViewModel()
    
    func getTimeDeposits() -> Observable<[TimeDeposit]> {
        accountVM.fetchData()
            .map { $0.first?.timeDeposits ?? [] }
    }
}
