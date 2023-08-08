//
//  NewTimeDepositViewModel.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//
import RxSwift

struct NewTimeDepositViewModel {
    
    // MARK: - Properties
    
    let value = BehaviorSubject<String>(value: "")
    
    var isHidden: Observable<Bool> {
        value.map { $0 == "" }
    }
    
    var formattedValue: Observable<String> {
        value.map { input in
            let string = input == "" ? "0" : input
            return formatToNumberString(string)
        }
    }
    
    func isValidAmount(_ amount: String) -> Bool {
        let numericAmount: Int = amount.formatToInt
        return numericAmount >= 500
    }
}
