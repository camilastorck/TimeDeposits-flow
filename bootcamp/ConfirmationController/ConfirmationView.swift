//
//  ConfirmationView.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import UIKit

final class ConfirmationView: UIView {
    
    // MARK: - Properties
    
    let startView: UIStackView = UIStackView.build(axis: .vertical, distribution: .equalCentering, alignment: .leading, spacing: 0)
    let endView: UIStackView = UIStackView.build(axis: .vertical, distribution: .equalCentering, alignment: .leading, spacing: 0)
    let investedView: UIStackView = UIStackView.build(axis: .vertical, distribution: .equalCentering, alignment: .leading, spacing: 0)
    let interestView: UIStackView = UIStackView.build(axis: .vertical, distribution: .equalCentering, alignment: .leading, spacing: 0)
    let tnaView: UIStackView = UIStackView.build(axis: .vertical, distribution: .equalCentering, alignment: .leading, spacing: 0)
    
    let collectLabel: UILabel = UILabel.build(alignment: .center, size: 15, weight: .semiBold, color: .secondaryLabel)
    let amountLabel: UILabel = UILabel.build(alignment: .center, size: 40, weight: .medium, color: .mainAppColor)
    let startLabel: UILabel = UILabel.build(alignment: .left, size: 16, weight: .semiBold, color: .secondaryLabel)
    let startDateLabel: UILabel = UILabel.build(alignment: .left, size: 20, weight: .bold, color: .mainLabel)
    let endLabel: UILabel = UILabel.build(alignment: .left, size: 16, weight: .semiBold, color: .secondaryLabel)
    let endDateLabel: UILabel = UILabel.build(alignment: .left, size: 20, weight: .bold, color: .mainLabel)
    let investedLabel: UILabel = UILabel.build(alignment: .left, size: 16, weight: .semiBold, color: .secondaryLabel)
    let investedAmountLabel: UILabel = UILabel.build(alignment: .left, size: 20, weight: .bold, color: .mainLabel)
    let interestGainedLabel: UILabel = UILabel.build(alignment: .left, size: 16, weight: .semiBold, color: .secondaryLabel)
    let interestGainedAmountLabel: UILabel = UILabel.build(alignment: .left, size: 20, weight: .bold, color: .mainLabel)
    let TNALabel: UILabel = UILabel.build(alignment: .left, size: 16, weight: .semiBold, color: .secondaryLabel)
    let TNAAmountLabel: UILabel = UILabel.build(alignment: .left, size: 20, weight: .bold, color: .mainLabel)
    
    let confirmButton: UIButton = prepareConfirmButton()
    let cancelButton: UIButton = prepareCancelButton()
    let dividerView: UIView = prepareDividerView()
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        configureView()
        setStyles()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
}

private extension ConfirmationView {
    
    func addSubviews() {
        startView.addArrangedSubview(startLabel)
        startView.addArrangedSubview(startDateLabel)
        endView.addArrangedSubview(endLabel)
        endView.addArrangedSubview(endDateLabel)
        investedView.addArrangedSubview(investedLabel)
        investedView.addArrangedSubview(investedAmountLabel)
        interestView.addArrangedSubview(interestGainedLabel)
        interestView.addArrangedSubview(interestGainedAmountLabel)
        tnaView.addArrangedSubview(TNALabel)
        tnaView.addArrangedSubview(TNAAmountLabel)
        
        addSubview(collectLabel)
        addSubview(amountLabel)
        addSubview(dividerView)
        addSubview(startView)
        addSubview(endView)
        addSubview(investedView)
        addSubview(interestView)
        addSubview(tnaView)
        addSubview(confirmButton)
        addSubview(cancelButton)
    }
    
    func setConstraints() {
        [startView, endView, investedView, interestView, tnaView, collectLabel, amountLabel, dividerView, confirmButton, cancelButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            collectLabel.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            collectLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            amountLabel.topAnchor.constraint(equalTo: collectLabel.bottomAnchor, constant: 12),
            amountLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            dividerView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 16),
            dividerView.widthAnchor.constraint(equalTo: widthAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.5),
            
            startView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 30),
            startView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            startView.widthAnchor.constraint(equalToConstant: 200),
            startView.heightAnchor.constraint(equalToConstant: 50),
            
            endView.leadingAnchor.constraint(equalTo: startView.trailingAnchor),
            endView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 30),
            endView.widthAnchor.constraint(equalToConstant: 200),
            endView.heightAnchor.constraint(equalToConstant: 50),
            
            investedView.topAnchor.constraint(equalTo: startView.bottomAnchor, constant: 20),
            investedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            investedView.widthAnchor.constraint(equalToConstant: 200),
            investedView.heightAnchor.constraint(equalToConstant: 50),
            
            interestView.leadingAnchor.constraint(equalTo: investedView.trailingAnchor),
            interestView.topAnchor.constraint(equalTo: endView.bottomAnchor, constant: 20),
            interestView.widthAnchor.constraint(equalToConstant: 200),
            interestView.heightAnchor.constraint(equalToConstant: 50),
            
            tnaView.topAnchor.constraint(equalTo: investedView.bottomAnchor, constant: 20),
            tnaView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tnaView.widthAnchor.constraint(equalToConstant: 200),
            tnaView.heightAnchor.constraint(equalToConstant: 50),
            
            confirmButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -10),
            confirmButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 55),
            
            cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            cancelButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            cancelButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func configureView() {
        collectLabel.text = "NewTermConfirmation.Collect".localized
        startLabel.text = "NewTermConfirmation.Start.Title".localized
        endLabel.text = "NewTermConfirmation.End.Title".localized
        investedLabel.text = "NewTermConfirmation.Invested.Title".localized
        interestGainedLabel.text = "NewTermConfirmation.Interest.Title".localized
        TNALabel.text = "NewTermConfirmation.TNA.Title".localized
        confirmButton.setTitle("NewTermConfirmation.Confirm.Title".localized, for: .normal)
        cancelButton.setTitle("NewTermConfirmation.Cancel.Title".localized, for: .normal)
    }
    
    func setStyles() {
        self.backgroundColor = .mainBackground
    }
}

// MARK: - View Components

private func prepareDividerView() -> UIView {
    let view = UIView()
    view.backgroundColor = .dividerGrey
    return view
}

private func prepareConfirmButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .mainAppColor
    button.titleLabel?.font = Theme.font(size: 19, weight: .bold)
    button.layer.cornerRadius = 9
    return button
}

private func prepareCancelButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .secondaryAppColor
    button.titleLabel?.font = Theme.font(size: 19, weight: .bold)
    button.setTitleColor(.cancelButtonTitle, for: .normal)
    button.layer.cornerRadius = 9
    return button
}
