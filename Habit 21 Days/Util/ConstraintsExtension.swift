//
//  ConstraintsExtension.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

struct Padding {
    var top: CGFloat?
    var left: CGFloat?
    var bottom: CGFloat?
    var right: CGFloat?
    
    init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
}

extension UIView {
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: Padding = Padding(), width: CGFloat? = nil, height: CGFloat? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, widthAnchorTo heightAnchorToUse: NSLayoutDimension? = nil, heightAnchorTo widthAnchorToUse: NSLayoutDimension? = nil, widthMultiplier: CGFloat = 1.0, heightMultiplier: CGFloat = 1.0) -> NSLayoutConstraint? {
        
        translatesAutoresizingMaskIntoConstraints = false
        var topConstraint: NSLayoutConstraint?
        
        if let top = top {
            topConstraint = topAnchor.constraint(equalTo: top, constant: padding.top ?? 0)
            topConstraint?.isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left ?? 0).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -(padding.bottom ?? 0)).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -(padding.right ?? 0)).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height{
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if heightAnchorToUse != nil {
            if let widthAnchor = widthAnchorToUse {
                heightAnchor.constraint(equalTo: widthAnchor, multiplier: heightMultiplier).isActive = true
            }
        }
        
        if widthAnchorToUse != nil {
            if let heightAnchor = heightAnchorToUse {
                widthAnchor.constraint(equalTo: heightAnchor, multiplier: widthMultiplier).isActive = true
            }
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

extension UIView {
    func width() -> CGFloat {
        return self.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.frame.size.height)).width
    }
}
