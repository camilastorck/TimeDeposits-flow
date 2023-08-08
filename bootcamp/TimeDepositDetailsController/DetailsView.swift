//
//  DetailsView.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import UIKit

final class DetailsView: UIView {
    
    let tableView: UITableView = prepareTableView()
    let endDateStack: UIStackView = prepareChooseDateStack()
    let mainButton: UIButton = prepareMainButton()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        configureView()
        setStyles()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
}

private extension DetailsView {
    
    func addSubviews() {
        addSubview(tableView)
        addSubview(endDateStack)
        addSubview(mainButton)
    }
    
    func setConstraints() {
        [tableView, endDateStack, mainButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.widthAnchor.constraint(equalTo: widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: endDateStack.topAnchor),
            
            endDateStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            endDateStack.heightAnchor.constraint(equalToConstant: 55),
            endDateStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            endDateStack.bottomAnchor.constraint(equalTo: mainButton.topAnchor, constant: -8),
            
            mainButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            mainButton.heightAnchor.constraint(equalToConstant: 55),
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }
    
    func configureView() {
        mainButton.setTitle("NewTermDetails.Button.Title".localized, for: .normal)
    }
    
    func setStyles() {
        backgroundColor = .secondaryBackground
    }
}

// MARK: - View Components

private func prepareTableView() -> UITableView {
    let tableView: UITableView = UITableView()
    tableView.separatorStyle = .none
    tableView.backgroundColor = .secondaryBackground
    tableView.register(DetailsCell.self, forCellReuseIdentifier: DetailsCell.identifier)
    return tableView
}

private func prepareChooseDateStack() -> UIStackView {
    let view = UIStackView.build(axis: .horizontal, distribution: .fillProportionally, alignment: .center, spacing: 10)
    let verticalStack = UIStackView.build(axis: .vertical, distribution: .fillEqually, alignment: .leading, spacing: 0)
    
    let button = UIButton()
    button.setImage(UIImage(systemName: "calendar.badge.clock"), for: .normal)
    button.tintColor = .mainLabel
    
    let title = UILabel()
    title.text = "NewTermDetails.Date.Title".localized
    title.textColor = .mainLabel
    title.font = Theme.font(size: 19, weight: .bold)
    
    let subtitle = UILabel()
    subtitle.text = "NewTermDetails.Date.Subtitle".localized
    subtitle.textColor = .secondaryLabel
    subtitle.font = Theme.font(size: 14, weight: .medium)
    
    verticalStack.addArrangedSubview(title)
    verticalStack.addArrangedSubview(subtitle)
    
    view.addArrangedSubview(button)
    view.addArrangedSubview(verticalStack)
    return view
}

private func prepareMainButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .secondaryLabel
    button.titleLabel?.font = Theme.font(size: 19, weight: .bold)
    button.layer.cornerRadius = 7
    return button
}
