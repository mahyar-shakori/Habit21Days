//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/18/24.
//

import UIKit

extension UIImage {
    func withColor(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()

        guard let context = UIGraphicsGetCurrentContext(),
              let cgImage = self.cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }

        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context.clip(to: rect, mask: cgImage)
        context.fill(rect)

        let coloredImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return coloredImg
    }
}
