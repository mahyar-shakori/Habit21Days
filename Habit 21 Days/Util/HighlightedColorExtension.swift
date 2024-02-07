//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/17/24.
//

import UIKit

private var normalBackgroundColorKey: UInt8 = 0
private var highlightedBackgroundColorKey: UInt8 = 0

extension UIButton {
    var normalBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &normalBackgroundColorKey) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &normalBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if backgroundColor == nil {
                backgroundColor = newValue 
            }
        }
    }
    
    var highlightedBackgroundColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &highlightedBackgroundColorKey) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &highlightedBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            addTarget(self, action: #selector(handleHighlight), for: [.touchDown, .touchDragEnter])
            addTarget(self, action: #selector(handleUnhighlight), for: [.touchUpInside, .touchCancel, .touchDragExit])
        }
    }
    
    @objc private func handleHighlight() {
        if let highlightedColor = highlightedBackgroundColor {
            backgroundColor = highlightedColor
        }
    }
    
    @objc private func handleUnhighlight() {
        if let normalColor = normalBackgroundColor {
            backgroundColor = normalColor
        }
    }
}

extension UIImage {
    func withReducedOpacity(_ opacity: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        
        guard let context = UIGraphicsGetCurrentContext(),
              let cgImage = self.cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -self.size.height)
        
        context.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context.draw(cgImage, in: rect)
        
        context.setBlendMode(.sourceIn)
        context.addRect(rect)
        context.setFillColor(UIColor(white: 1.0, alpha: opacity).cgColor)
        context.drawPath(using: .fill)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
