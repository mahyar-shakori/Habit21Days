//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/8/24.
//

import UIKit

extension UIView {
    func addCornerView(corner: CGFloat) {
        layer.cornerRadius = corner
        layer.masksToBounds = true
    }
}
