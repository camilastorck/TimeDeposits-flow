//
//  TimeDepositsARSViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import UIKit
import RxSwift

struct TimeDepositsARSViewModel {
    
    // MARK: - Properties
    
    let accountVM: AccountViewModel
    private let _timeDeposits = BehaviorSubject<[TimeDeposit]>(value: [])
    var timeDeposits: Observable<[TimeDeposit]> {
        _timeDeposits
    }
    private let bag = DisposeBag()
    
    func getTimeDeposits() {
        accountVM.fetchData()
            .map { accounts in
                let account = accounts.filter { $0.currency == "ARS" }
                return account.first?.timeDeposits ?? []
            }
            .bind(to: _timeDeposits)
            .disposed(by: bag)
    }
}
