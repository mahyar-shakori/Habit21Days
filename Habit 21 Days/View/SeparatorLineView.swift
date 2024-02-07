//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/14/24.
//

import UIKit

final class SeparatorLine: UIView {

    init(backgroundColor: UIColor = .systemGray5, height: CGFloat = 1) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
