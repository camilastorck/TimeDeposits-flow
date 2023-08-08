//
//  UIStackView+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 30/11/2022.
//

import UIKit

extension UIStackView {
    
    static func build(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, spacing: CGFloat) -> UIStackView {
        let stack: UIStackView = UIStackView()
        stack.axis = axis
        stack.distribution = distribution
        stack.alignment = alignment
        stack.spacing = spacing
        return stack
    }
}
