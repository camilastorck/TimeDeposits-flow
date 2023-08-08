//
//  InvestmentsView.swift
//  bootcamp
//
//  Created by Camila Storck on 30/11/2022.
//

import UIKit

final class InvestmentsView: UIView {
    
    let scrollView: UIScrollView = prepareScrollView()
    let control: UISegmentedControl = CustomSegmentedControl(items: ["Investment.Dolares".localized, "Investment.TimeDeposit".localized],
                                                             selectedIndex: 1)
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        setConstraints()
        configureView()
        setStyles()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
}

private extension InvestmentsView {
    
    func addSubviews() {
        addSubview(control)
        addSubview(scrollView)
    }
    
    func setConstraints() {
        [control, scrollView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            control.centerXAnchor.constraint(equalTo: centerXAnchor),
            control.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            control.widthAnchor.constraint(equalTo: widthAnchor, constant: -130),
            control.heightAnchor.constraint(equalToConstant: 40),
            
            scrollView.topAnchor.constraint(equalTo: control.bottomAnchor, constant: 20),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureView() {
        scrollView.contentSize = CGSize(width: frame.size.width * 2, height: 0)
    }
    
    func setStyles() {
        backgroundColor = .mainBackground
    }
}

// MARK: - View Components

private func prepareScrollView() -> UIScrollView {
    let scrollView: UIScrollView = UIScrollView()
    scrollView.isPagingEnabled = true
    return scrollView
}
