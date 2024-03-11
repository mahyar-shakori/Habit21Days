//
//  BackgroundCircleExtension.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/28/24.
//

import UIKit

extension UIImage {
    static func addBackgroundCircle(
        withSymbol symbolName: String? = nil,
        color: UIColor?,
        diameter: CGFloat = 30.0,
        symbolConfig: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 17.0, weight: .bold, scale: .large),
        tintColor: UIColor? = nil
    ) -> UIImage? {
        let circleSize = CGSize(width: diameter, height: diameter)
        let circleFrame = CGRect(x: 0, y: 0, width: diameter, height: diameter)

        let view = UIView(frame: circleFrame)
        view.backgroundColor = color ?? .systemRed
        view.layer.cornerRadius = diameter * 0.5

        UIGraphicsBeginImageContextWithOptions(circleSize, false, UIScreen.main.scale)

        let renderer = UIGraphicsImageRenderer(size: circleSize)
        let circleImage = renderer.image { _ in
            view.drawHierarchy(in: circleFrame, afterScreenUpdates: true)
        }

        circleImage.draw(in: circleFrame, blendMode: .normal, alpha: 1.0)

        if let symbolName = symbolName, var symbolImage = UIImage(systemName: symbolName, withConfiguration: symbolConfig) {
            if let tintColor = tintColor {
                symbolImage = symbolImage.withTintColor(tintColor, renderingMode: .alwaysOriginal)
            }
            
            let symbolSize = symbolImage.size
            let symbolFrame = CGRect(x: (diameter - symbolSize.width) / 2, y: (diameter - symbolSize.height) / 2, width: symbolSize.width, height: symbolSize.height)
            symbolImage.draw(in: symbolFrame, blendMode: .normal, alpha: 1.0)
        }

        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }
}
