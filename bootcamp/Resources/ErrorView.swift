//
//  ErrorView.swift
//  bootcamp
//
//  Created by Camila Storck on 05/12/2022.
//

import UIKit

final class ErrorView: UIView {
    
    private let stack: UIStackView = UIStackView.build(axis: .vertical, distribution: .equalCentering, alignment: .center, spacing: 0)
    private let title: UILabel = UILabel.build(alignment: .center, size: 15, weight: .light, color: .errorTitle)
    
    init(message: String) {
        super.init(frame: .zero)
        setUpView()
        configure(for: message)
    }
    
    override func layoutSubviews() {
        stack.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    private func configure(for message: String) {
        title.text = message
    }
    
    private func setUpView() {
        self.backgroundColor = .errorBackground
        stack.addArrangedSubview(title)
        addSubview(stack)
    }
}
