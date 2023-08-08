//
//  TimeDepositCell.swift
//  FixedTerms
//
//  Created by Camila Storck on 14/11/2022.
//

import UIKit

final class TimeDepositCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "timeDepositCell"
    
    private let mainStack = UIStackView.build(axis: .vertical, distribution: .fill, alignment: .center, spacing: 0)
    private let capitalStack = UIStackView.build(axis: .vertical, distribution: .fillEqually, alignment: .leading, spacing: -35)
    private let interestStack = UIStackView.build(axis: .vertical, distribution: .fillEqually, alignment: .trailing, spacing: -35)
    private let endDateStack = UIStackView.build(axis: .vertical, distribution: .fillEqually, alignment: .leading, spacing: -35)
    private let topStack = UIStackView()
    private let bottomStack = UIStackView()
    
    private let capitalToRecieveLabel = UILabel.build(alignment: .left, size: 13, weight: .medium, color: .secondaryLabel)
    private let capitalToRecieveAmount = UILabel.build(alignment: .left, size: 17, weight: .bold, color: .mainLabel)
    private let annualInterestLabel = UILabel.build(alignment: .right, size: 13, weight: .medium, color: .secondaryLabel)
    private let annualPercentageRate = UILabel.build(alignment: .right, size: 17, weight: .bold, color: .mainLabel)
    private let endLabel = UILabel.build(alignment: .left, size: 13, weight: .medium, color: .secondaryLabel)
    private let endDateLabel = UILabel.build(alignment: .left, size: 15, weight: .medium, color: .mainLabel)
    
    private let rightArrowButton: UIButton = prepareRightArrowButton()
    private let divider: UIView = prepareDividerView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        configureMainView()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    func configureCell(with viewModel: TimeDepositCellViewModel) {
        capitalToRecieveLabel.text = "FixedTerm.Cell.Capital".localized
        annualInterestLabel.text = "FixedTerm.Cell.Interest".localized
        endLabel.text = "FixedTerm.Cell.End".localized
        capitalToRecieveAmount.text = viewModel.capitalToRecieveAmount
        annualPercentageRate.text = viewModel.annualPercentageRate
        endDateLabel.text = viewModel.endDateLabel
    }
    
    private func configureMainView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        self.selectedBackgroundView = backgroundView
        
        mainStack.backgroundColor = .secondaryBackground
        mainStack.layer.cornerRadius = 7
    }
}

private extension TimeDepositCell {
    
    func addSubviews() {
        capitalStack.addArrangedSubview(capitalToRecieveLabel)
        capitalStack.addArrangedSubview(capitalToRecieveAmount)
        
        interestStack.addArrangedSubview(annualInterestLabel)
        interestStack.addArrangedSubview(annualPercentageRate)
        
        endDateStack.addArrangedSubview(endLabel)
        endDateStack.addArrangedSubview(endDateLabel)
        
        topStack.addArrangedSubview(capitalStack)
        topStack.addArrangedSubview(interestStack)
        
        bottomStack.addArrangedSubview(endDateStack)
        bottomStack.addArrangedSubview(rightArrowButton)
        
        mainStack.addArrangedSubview(topStack)
        mainStack.addArrangedSubview(divider)
        mainStack.addArrangedSubview(bottomStack)
        addSubview(mainStack)
    }
    
    func setConstraints() {
        [mainStack, capitalToRecieveLabel, capitalToRecieveAmount, annualInterestLabel, annualPercentageRate, endLabel, endDateLabel, rightArrowButton, divider].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 180),
            
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            topStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor),
            topStack.topAnchor.constraint(equalTo: mainStack.topAnchor),
            
            capitalToRecieveLabel.leadingAnchor.constraint(equalTo: topStack.leadingAnchor, constant: 16),
            capitalToRecieveAmount.leadingAnchor.constraint(equalTo: topStack.leadingAnchor, constant: 16),
            
            annualInterestLabel.trailingAnchor.constraint(equalTo: topStack.trailingAnchor, constant: -16),
            annualPercentageRate.trailingAnchor.constraint(equalTo: topStack.trailingAnchor, constant: -16),
            
            divider.widthAnchor.constraint(equalTo: mainStack.widthAnchor, constant: -35),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            bottomStack.widthAnchor.constraint(equalTo: mainStack.widthAnchor),
            bottomStack.bottomAnchor.constraint(equalTo: mainStack.bottomAnchor),
            bottomStack.heightAnchor.constraint(equalToConstant: 75),
            
            endLabel.leadingAnchor.constraint(equalTo: bottomStack.leadingAnchor, constant: 16),
            endDateLabel.leadingAnchor.constraint(equalTo: bottomStack.leadingAnchor, constant: 16),
            
            rightArrowButton.trailingAnchor.constraint(equalTo: mainStack.trailingAnchor, constant: -16),
        ])
    }
}

// MARK: - View Components

private func prepareRightArrowButton() -> UIButton {
    let button = UIButton()
    button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
    button.tintColor = .mainAppColor
    return button
}

private func prepareDividerView() -> UIView {
    let view: UIView = UIView()
    view.backgroundColor = .dividerGrey
    return view
}
