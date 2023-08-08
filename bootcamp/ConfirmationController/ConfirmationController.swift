//
//  ConfirmationController.swift
//  FixedTerms
//
//  Created by Camila Storck on 15/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

final class ConfirmationController: UIViewController {
    
    // MARK: - Properties
    
    private let confirmationView: ConfirmationView = ConfirmationView()
    private let confirmationVM: ConfirmationViewModel
    private let timeDepositOptionsVW: TimeDepositOptionsViewModel = TimeDepositOptionsViewModel()
    private let bag = DisposeBag()
    
    private let accountVM: AccountViewModel
    private let timeDepositOptionSelected: TimeDepositOption
    private let accountId: String
    private let balance: String
    private let amount: Int
    
    init(accountVM: AccountViewModel, timeDepositOptionSelected: TimeDepositOption, accountId: String, balance: String, amount: Int) {
        self.accountVM = accountVM
        self.timeDepositOptionSelected = timeDepositOptionSelected
        self.accountId = accountId
        self.balance = balance
        self.amount = amount
        self.confirmationVM = ConfirmationViewModel(timeDepositOption: timeDepositOptionSelected, amount: amount)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        configureView()
        configureStates()
    }
    
    override func loadView() {
        view = confirmationView
    }
    
    // MARK: - Actions
    
    private func navigate() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func closeVC() {
        navigationController?.popViewController(animated: true)
    }
}

private extension ConfirmationController {
    
    func bindViewModel() {
        confirmationView.amountLabel.text = confirmationVM.amountLabel
        confirmationView.startDateLabel.text = confirmationVM.startDateLabel
        confirmationView.endDateLabel.text = confirmationVM.endDateLabel
        confirmationView.investedAmountLabel.text = confirmationVM.investedAmountLabel
        confirmationView.interestGainedAmountLabel.text = confirmationVM.interestGainedAmountLabel
        confirmationView.TNAAmountLabel.text = confirmationVM.TNAAmountLabel
    }
    
    func configureView() {
        title = "NewTermConfirmation.Title".localized
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(closeVC))
        self.navigationItem.leftBarButtonItem?.tintColor = .gray
    }
    
    func configureStates() {
        confirmationView.confirmButton.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                owner.createTimeDeposit()
                owner.navigate()
            }
            .disposed(by: bag)
        
        confirmationView.cancelButton.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                owner.navigate()
            }
            .disposed(by: bag)
    }
    
    func createTimeDeposit() {
        let formattedBalance: Int = balance.formatToInt
        timeDepositOptionsVW.createTimeDeposit(timeDeposit: timeDepositOptionSelected, amount: amount, accountId: accountId, balance: formattedBalance)
            .subscribe(onNext: { print($0) },
                       onError: { print($0) })
            .disposed(by: bag)
    }
}
