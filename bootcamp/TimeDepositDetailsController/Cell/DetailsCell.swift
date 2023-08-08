//
//  DetailsCell.swift
//  FixedTerms
//
//  Created by Camila Storck on 15/11/2022.
//

import UIKit

final class DetailsCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier: String = "detailsCell"
    
    private let mainStack: UIStackView = UIStackView.build(axis: .horizontal, distribution: .fill, alignment: .center, spacing: 12)
    private let labelStack: UIStackView = UIStackView.build(axis: .vertical, distribution: .fillEqually, alignment: .leading, spacing: 0)
    private let amountStack: UIStackView = UIStackView.build(axis: .vertical, distribution: .fillEqually, alignment: .trailing, spacing: 0)
    
    private let timeLabel: UILabel = UILabel.build(alignment: .left, size: 18, weight: .bold, color: .mainLabel)
    private let endDateLabel: UILabel = UILabel.build(alignment: .left, size: 13, weight: .medium, color: .secondaryLabel)
    private let amountLabel: UILabel = UILabel.build(alignment: .right, size: 18, weight: .bold, color: .mainAppColor)
    private let recieveLabel: UILabel = UILabel.build(alignment: .right, size: 13, weight: .medium, color: .secondaryLabel)
    
    private let percentageButton: UIButton = preparePercentageButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        configureView()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    func configureCell(with viewModel: DetailsCellViewModel) {
        recieveLabel.text = "Details.Cell.Recieve".localized
        percentageButton.setTitle(viewModel.annualPercentageRate, for: .normal)
        timeLabel.text = viewModel.timeLabel
        endDateLabel.text = viewModel.endDateLabel
        amountLabel.text = viewModel.amountLabel
    }
    
    private func configureView() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .secondaryAppColor
        selectedBackgroundView = backgroundView
        backgroundColor = .secondaryBackground
    }
}

private extension DetailsCell {
    
    func addSubviews() {
        labelStack.addArrangedSubview(timeLabel)
        labelStack.addArrangedSubview(endDateLabel)
        
        amountStack.addArrangedSubview(amountLabel)
        amountStack.addArrangedSubview(recieveLabel)
        
        mainStack.addArrangedSubview(percentageButton)
        mainStack.addArrangedSubview(labelStack)
        mainStack.addArrangedSubview(amountStack)
        addSubview(mainStack)
    }
    
    func setConstraints() {
        [mainStack, percentageButton, labelStack, timeLabel, endDateLabel, amountStack, amountLabel,recieveLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 65),
            
            mainStack.heightAnchor.constraint(equalTo: heightAnchor, constant: -20),
            mainStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            mainStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            percentageButton.widthAnchor.constraint(equalToConstant: 62),
            percentageButton.heightAnchor.constraint(equalTo: mainStack.heightAnchor, constant: -10),
        ])
    }
}

// MARK: - View Components

private func preparePercentageButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .white
    button.layer.borderColor = CGColor(red: 0.38, green: 0.29, blue: 0.85, alpha: 1.00)
    button.layer.borderWidth = 2
    button.layer.cornerRadius = 7
    button.titleLabel?.font = Theme.font(size: 17, weight: .bold)
    button.setTitleColor(.mainAppColor, for: .normal)
    return button
}


