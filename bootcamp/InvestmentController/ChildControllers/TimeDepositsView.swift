//
//  TimeDepositsView.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import UIKit

final class TimeDepositsView: UIView {
    
    let tableView: UITableView = prepareTableView()
    let mainButton: UIButton = prepareMainButton()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        setStyles()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
}

private extension TimeDepositsView {
    
    func addSubviews() {
        addSubview(tableView)
        addSubview(mainButton)
    }
    
    func setConstraints() {
        [tableView, mainButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -8),
            
            mainButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            mainButton.heightAnchor.constraint(equalToConstant: 55),
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12)
        ])
    }
    
    func setStyles() {
        backgroundColor = .mainBackground
    }
}

// MARK: - View Components

private func prepareTableView() -> UITableView {
    let tableView: UITableView = UITableView()
    tableView.separatorStyle = .none
    tableView.register(TimeDepositCell.self, forCellReuseIdentifier: TimeDepositCell.identifier)
    return tableView
}

private func prepareMainButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .mainAppColor
    button.layer.cornerRadius = 7
    button.setTitle("Investments.Button.Title".localized, for: .normal)
    button.titleLabel?.font = Theme.font(size: 19, weight: .bold)
    return button
}
