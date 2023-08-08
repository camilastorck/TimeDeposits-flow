//
//  UILabel+Extension.swift
//  bootcamp
//
//  Created by Camila Storck on 30/11/2022.
//

import UIKit

extension UILabel {
    
    static func build(alignment: NSTextAlignment, size: CGFloat, weight: FontWeight, color: UIColor) -> UILabel {
        let label: UILabel = UILabel()
        label.textAlignment = alignment
        label.font = Theme.font(size: size, weight: weight)
        label.textColor = color
        return label
    }
}
