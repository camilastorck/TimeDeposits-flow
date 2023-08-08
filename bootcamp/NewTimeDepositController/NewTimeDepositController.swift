//
//  NewTimeDepositController.swift
//  FixedTerms
//
//  Created by Camila Storck on 15/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

final class NewTimeDepositController: UIViewController {
    
    let newTimeDepositView: NewTimeDepositView = NewTimeDepositView()
    private let newTimeDepositVM: NewTimeDepositViewModel = NewTimeDepositViewModel()
    private let accountVM: AccountViewModel
    private let router: NewTimeDepositControllerRouterProtocol
    private let bag = DisposeBag()
    
    var balance: String = ""
    var accountId: String = ""
    
    init(accountVM: AccountViewModel, router: NewTimeDepositControllerRouterProtocol = NewTimeDepositControllerRouter()) {
        self.accountVM = accountVM
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureStates()
    }
    
    override func loadView() {
        view = newTimeDepositView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        newTimeDepositView.timeDepositAmountField.becomeFirstResponder()
    }
    
    private func navigate(with amount: String) {
        router.navigate(with: accountId, balance: balance, amount: amount, nav: navigationController)
    }
    
    private func displayError() {
        newTimeDepositView.mainButton.isHidden = true
        newTimeDepositView.errorView.alpha = 1
    }
    
    @objc private func closeVC() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func keyboardWillShow(_ sender: NSNotification) {
        guard let userInfo = sender.userInfo else { return }
        let keyboardFrame: NSValue? = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        guard let keyboardHeight: CGFloat = keyboardFrame?.cgRectValue.height else { return }
        view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - keyboardHeight)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    func fieldEditingChanged(for text: String) {
        newTimeDepositView.timeDepositAmountField.textColor = .mainAppColor
        newTimeDepositView.errorView.alpha = 0
        
        if text == "" {
            newTimeDepositView.timeDepositAmountField.textColor = .secondaryLabel
        }
    }
}

private extension NewTimeDepositController {
    
    func configureStates() {
        accountVM.fetchData()
            .map { [weak self] accounts in
                let account = accounts.filter { $0.currency == "ARS" }
                let balance = account.first?.formattedBalance ?? ""
                let id = account.first?.id ?? ""
                
                self?.balance = balance
                self?.accountId = id
                return "SALDO: $ \(balance)"
            }
            .bind(to: newTimeDepositView.balanceLabel.rx.text)
            .disposed(by: bag)
        
        newTimeDepositView.timeDepositAmountField.rx.controlEvent(.editingChanged)
            .withLatestFrom(newTimeDepositView.timeDepositAmountField.rx.text.orEmpty)
            .do(onNext: { [weak self] value in
                self?.fieldEditingChanged(for: value)
            })
            .bind(to: newTimeDepositVM.value)
            .disposed(by: bag)
        
        newTimeDepositVM.formattedValue
            .bind(to: newTimeDepositView.timeDepositAmountField.rx.text)
            .disposed(by: bag)
        
        newTimeDepositVM.isHidden
            .bind(to: newTimeDepositView.mainButton.rx.isHidden)
            .disposed(by: bag)
        
        newTimeDepositView.mainButton.rx.tap
            .withLatestFrom(newTimeDepositView.timeDepositAmountField.rx.text.orEmpty)
            .withUnretained(self)
            .subscribe { (owner, amount) in
                owner.newTimeDepositVM.isValidAmount(amount) ? owner.navigate(with: amount) : owner.displayError()
            }
            .disposed(by: bag)
    }
    
    func configureView() {
        title = "NewFixedTerm.Title".localized
        newTimeDepositView.mainButton.isHidden = true
        let barItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeVC))
        self.navigationItem.leftBarButtonItem = barItem
        self.navigationItem.leftBarButtonItem?.tintColor = .gray
    }
    
    func configureKeyboard() {
        newTimeDepositView.timeDepositAmountField.keyboardType = .numberPad
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
}
