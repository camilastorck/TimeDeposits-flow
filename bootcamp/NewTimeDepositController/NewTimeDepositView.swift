//
//  NewTimeDepositView.swift
//  bootcamp
//
//  Created by Camila Storck on 22/11/2022.
//

import UIKit

final class NewTimeDepositView: UIView {
    
    // MARK: - Properties
    
    let balanceLabel: UILabel = UILabel.build(alignment: .center, size: 20, weight: .semiBold, color: .secondaryLabel)
    let currencyLabel: UILabel = UILabel.build(alignment: .right, size: 33, weight: .medium, color: .secondaryLabel)
    let timeDepositAmountField: UITextField = prepareTimeDepositAmountField()
    let mainButton: UIButton = prepareMainButton()
    
    let errorView: UIView = ErrorView(message: "InvalidAmount.Message".localized)
    let control: UISegmentedControl = CustomSegmentedControl(items: ["New.Pesos".localized, "New.Dolares".localized, "New.Uvas".localized],
                                                             selectedIndex: 0)
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        setStyles()
        configureView()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
}

private extension NewTimeDepositView {
    
    func addSubviews() {
        addSubview(control)
        addSubview(balanceLabel)
        addSubview(currencyLabel)
        addSubview(timeDepositAmountField)
        addSubview(mainButton)
        addSubview(errorView)
    }
    
    func setConstraints() {
        [control, balanceLabel, mainButton, currencyLabel, timeDepositAmountField, errorView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            control.centerXAnchor.constraint(equalTo: centerXAnchor),
            control.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            control.widthAnchor.constraint(equalTo: widthAnchor, constant: -130),
            control.heightAnchor.constraint(equalToConstant: 35),
            
            balanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            balanceLabel.topAnchor.constraint(equalTo: control.bottomAnchor, constant: 40),
            
            timeDepositAmountField.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 40),
            timeDepositAmountField.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 16),
            timeDepositAmountField.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, constant: -60),
            
            currencyLabel.centerYAnchor.constraint(equalTo: timeDepositAmountField.centerYAnchor),
            currencyLabel.trailingAnchor.constraint(equalTo: timeDepositAmountField.leadingAnchor, constant: -12),
            
            mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            mainButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            mainButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainButton.heightAnchor.constraint(equalToConstant: 55),
            
            errorView.widthAnchor.constraint(equalTo: widthAnchor),
            errorView.heightAnchor.constraint(equalTo: mainButton.heightAnchor),
            errorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setStyles() {
        backgroundColor = .mainBackground
    }
    
    func configureView() {
        mainButton.setTitle("NewFixedTerm.Button.Title".localized, for: .normal)
        currencyLabel.text = "NewFixedTerm.Currency".localized
        timeDepositAmountField.text = "NewFixedTerm.Amount.Placeholder".localized
        errorView.alpha = 0
    }
}

// MARK: - View Components

private func prepareTimeDepositAmountField() -> UITextField {
    let field = UITextField()
    field.textAlignment = .center
    field.textColor = .secondaryLabel
    field.tintColor = .clear
    field.font = Theme.font(size: 67, weight: .medium)
    return field
}

private func prepareMainButton() -> UIButton {
    let button = UIButton()
    button.backgroundColor = .mainAppColor
    button.titleLabel?.font = Theme.font(size: 19, weight: .bold)
    button.layer.cornerRadius = 7
    return button
}
