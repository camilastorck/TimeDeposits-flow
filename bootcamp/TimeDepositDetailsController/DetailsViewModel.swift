//
//  DetailsViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import RxSwift

struct DetailsViewModel {
    
    // MARK: - Properties
    
    let timeDepositOptionsVM: TimeDepositOptionsViewModel
    
    func getTimeDepositsOptions(for amount: Int) -> Observable<[TimeDepositOption]> {
        timeDepositOptionsVM.fetchData()
            .map { $0.filter { $0.currency == .ars && amount >= $0.minAmountFormatted && amount <= $0.maxAmountFormatted } }
    }
}
