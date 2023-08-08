//
//  CustomSegmentedControl.swift
//  bootcamp
//
//  Created by Camila Storck on 01/12/2022.
//

import UIKit

final class CustomSegmentedControl: UISegmentedControl {
    
    private let segmentInset: CGFloat = 7
    private let segmentImage: UIImage? = UIImage(color: UIColor.mainBackground)
    private let items: [String]
    private let selectedIndex: Int
    
    init(items: [String], selectedIndex: Int) {
        self.items = items
        self.selectedIndex = selectedIndex
        super.init(items: items)
        configure()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { nil }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
        }
    }
    
    private func configure() {
        let font = Theme.font(size: 12, weight: .semiBold)
        let notSelectedColor: UIColor = .secondaryLabel
        let selectedColor: UIColor = .mainLabel
        
        selectedSegmentIndex = selectedIndex
        backgroundColor = .secondaryBackground
        setTitleTextAttributes([NSAttributedString.Key.font: font,
                                NSAttributedString.Key.foregroundColor: notSelectedColor], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.font: font,
                                NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
    }
}
