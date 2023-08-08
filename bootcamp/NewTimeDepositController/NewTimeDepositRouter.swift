//
//  NewTimeDepositRouter.swift
//  bootcamp
//
//  Created by Camila Storck on 02/01/2023.
//

import UIKit

protocol NewTimeDepositControllerRouterProtocol {
    func navigate(with accountId: String, balance: String, amount: String, nav: UINavigationController?)
}

struct NewTimeDepositControllerRouter: NewTimeDepositControllerRouterProtocol {
    func navigate(with accountId: String, balance: String, amount: String, nav: UINavigationController?) {
        let formattedAmount: Int = amount.formatToInt
        let vc = TimeDepositDetailsController(accountId: accountId, balance: balance, amount: formattedAmount)
        nav?.pushViewController(vc, animated: true)
    }
}
