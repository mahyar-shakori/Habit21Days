//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/14/24.
//

import UIKit

final class SeparatorLine: UIView {
    private var heightConstraint: NSLayoutConstraint?
    
    init(backgroundColor: UIColor = .systemGray5, height: CGFloat = 1) {
        super.init(frame: .zero)
        setupView(backgroundColor: backgroundColor, height: height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(backgroundColor: UIColor, height: CGFloat) {
        self.backgroundColor = backgroundColor
        self.anchor(height: height)
    }
    
    var separatorHeight: CGFloat {
        get {
            return heightConstraint?.constant ?? 0
        }
        set {
            heightConstraint?.constant = newValue
            layoutIfNeeded()
        }
    }
    
    override var backgroundColor: UIColor? {
        didSet {
            super.backgroundColor = backgroundColor
        }
    }
}
