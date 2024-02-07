//
//  ConstraintsExtension.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, width: CGFloat? = nil, height: CGFloat? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, widthAnchorTo heightAnchor: NSLayoutDimension? = nil, heightAnchorTo widthAnchor: NSLayoutDimension? = nil, widthMultiplier: CGFloat = 1.0, heightMultiplier: CGFloat = 1.0) -> NSLayoutConstraint? {
        
        translatesAutoresizingMaskIntoConstraints = false
        var topConstraint: NSLayoutConstraint?
        
        if let top = top {
            topConstraint = topAnchor.constraint(equalTo: top, constant: padding.top)
            topConstraint?.isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
//        if let width = width {
//            widthAnchor.constraint(equalToConstant: width).isActive = true
//        }
//        
//        if let height = height {
//            heightAnchor.constraint(equalToConstant: height).isActive = true
//        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if let heightAnchor = heightAnchor {
            widthAnchor?.constraint(equalTo: heightAnchor, multiplier: widthMultiplier).isActive = true
        }
        
        if let widthAnchor = widthAnchor {
            heightAnchor?.constraint(equalTo: widthAnchor, multiplier: heightMultiplier).isActive = true
        }
        return topConstraint
    }
}

extension UIView {
    var safeTopAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.topAnchor
    }

    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.leadingAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
        return safeAreaLayoutGuide.bottomAnchor
    }

    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        return safeAreaLayoutGuide.trailingAnchor
    }
}
