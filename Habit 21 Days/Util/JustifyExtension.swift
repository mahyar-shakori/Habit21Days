//
//  JustifyExtension.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit

extension UILabel {
    func justifyLabel(str: String) -> NSAttributedString
    {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.justified
        paragraphStyle.lineSpacing = 3
        let attributedString = NSAttributedString(string: str,
                                                  attributes: [
                                                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                    NSAttributedString.Key.baselineOffset: NSNumber(value: 0)
                                                  ])
        return attributedString
    }
}
