//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

protocol AlertDisplay: UIViewController {
}

extension AlertDisplay {
    func showAlert(title: String, message: String, primaryButtonTitle: String?, primaryButtonStyle: UIAlertAction.Style = .default, primaryAction: (() -> Void)?, secondaryButtonTitle: String?, secondaryButtonStyle: UIAlertAction.Style = .default, secondaryAction: (() -> Void)?, completion: (() -> Void)? = nil) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let primaryTitle = primaryButtonTitle {
            let primaryButton = UIAlertAction(title: primaryTitle, style: primaryButtonStyle) { _ in
                primaryAction?()
            }
            alert.addAction(primaryButton)
        }

        if let secondaryTitle = secondaryButtonTitle {
            let secondaryButton = UIAlertAction(title: secondaryTitle, style: secondaryButtonStyle) { _ in
                secondaryAction?()
            }
            alert.addAction(secondaryButton)
        }

        self.present(alert, animated: true, completion: completion)
    }
}
