//
//  TimeDepositsARSController.swift
//  bootcamp
//
//  Created by Camila Storck on 30/11/2022.
//

import UIKit
import RxSwift
import RxCocoa

final class TimeDepositsARSController: UIViewController {
    
    private let timeDepositsVM: TimeDepositsARSViewModel = TimeDepositsARSViewModel(accountVM: AccountViewModel())
    private let depositDetailsVM: DetailsViewModel = DetailsViewModel(timeDepositOptionsVM: TimeDepositOptionsViewModel())
    private let timeDepositsARSView: TimeDepositsView = TimeDepositsView()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStates()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timeDepositsVM.getTimeDeposits()
    }
    
    override func loadView() {
        view = timeDepositsARSView
    }
}

private extension TimeDepositsARSController {
    
    func configureStates() {
        timeDepositsARSView.mainButton.rx.tap
            .withUnretained(self)
            .subscribe { (owner, _) in
                let vc = NewTimeDepositController(accountVM: AccountViewModel())
                owner.navigationController?.pushViewController(vc, animated: true)
            }
            .disposed(by: bag)
    }
}

private extension TimeDepositsARSController {
    
    func configureTableView() {
        timeDepositsVM.timeDeposits
            .bind(to: timeDepositsARSView.tableView.rx
                .items(cellIdentifier: TimeDepositCell.identifier, cellType: TimeDepositCell.self)) { _, item, cell in
                    let viewModel = TimeDepositCellViewModel(timeDeposit: item)
                    cell.configureCell(with: viewModel)
                }
                .disposed(by: bag)
    }
}
