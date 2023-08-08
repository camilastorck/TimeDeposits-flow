//
//  TimeDepositDetailsController.swift
//  FixedTerms
//
//  Created by Camila Storck on 15/11/2022.
//

import UIKit
import RxSwift

final class TimeDepositDetailsController: UIViewController {
    
    // MARK: - Properties
    
    private let depositDetailsVM: DetailsViewModel = DetailsViewModel(timeDepositOptionsVM: TimeDepositOptionsViewModel())
    private let depositDetailsView: DetailsView = DetailsView()
    private let accountId: String
    private let balance: String
    private let amount: Int
    
    private let selected = BehaviorSubject<Bool>(value: false)
    private let bag = DisposeBag()
    
    init(accountId: String, balance: String, amount: Int) {
        self.accountId = accountId
        self.balance = balance
        self.amount = amount
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureStates()
        configureTableView()
    }
    
    override func loadView() {
        view = depositDetailsView
    }
    
    @objc private func closeVC() {
        navigationController?.popViewController(animated: true)
    }
}

private extension TimeDepositDetailsController {
    
    func configureView() {
        title = "NewTermDetails.Title".localized
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeVC))
        self.navigationItem.leftBarButtonItem?.tintColor = .gray
    }
    
    func configureStates() {
        selected
            .withUnretained(self)
            .subscribe { (owner, value) in
                owner.depositDetailsView.mainButton.isEnabled = value
                owner.depositDetailsView.mainButton.backgroundColor = value ? .mainAppColor : .secondaryLabel
            }
            .disposed(by: bag)
        
        depositDetailsView.mainButton.rx.tap
            .withLatestFrom(depositDetailsView.tableView.rx.modelSelected(TimeDepositOption.self))
            .withUnretained(self)
            .subscribe { (owner, timeDepositOption) in
                let vc = ConfirmationController(accountVM: AccountViewModel(), timeDepositOptionSelected: timeDepositOption, accountId: owner.accountId, balance: owner.balance, amount: owner.amount)
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: bag)
    }
}

private extension TimeDepositDetailsController {
    
    func configureTableView() {
        depositDetailsVM.getTimeDepositsOptions(for: amount)
            .bind(to: depositDetailsView.tableView.rx
                .items(cellIdentifier: DetailsCell.identifier, cellType: DetailsCell.self)) { [weak self] _, item, cell in
                    guard let self = self else { return }
                    let viewModel = DetailsCellViewModel(timeDepositOption: item, amount: self.amount)
                    cell.configureCell(with: viewModel)
                }
                .disposed(by: bag)
        
        depositDetailsView.tableView.rx.modelSelected(TimeDepositOption.self)
            .withUnretained(self)
            .subscribe { (owner, timeDepositOption) in
                owner.selected.onNext(true)
            }
            .disposed(by: bag)
    }
}
