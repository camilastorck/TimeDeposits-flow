//
//  Theme.swift
//  bootcamp
//
//  Created by Camila Storck on 23/11/2022.
//

import UIKit

final class Theme {
    
    private static let fontName: String = "ProximaNovaSoft"
    
    private static func customFontName(weight: FontWeight) -> String {
        switch weight {
        case .light, .medium, .semiBold, .bold:
            return "\(fontName)-\(weight.rawValue)"
        }
    }
    
    static func font(size: CGFloat, weight: FontWeight) -> UIFont {
        let fullName: String = customFontName(weight: weight)
        let font = UIFont(name: fullName, size: size)
        return font ?? UIFont.systemFont(ofSize: size)
    }
}

enum FontWeight: String {
    case light = "Regular"
    case medium = "Medium"
    case semiBold = "SemiBold"
    case bold = "Bold"
}
