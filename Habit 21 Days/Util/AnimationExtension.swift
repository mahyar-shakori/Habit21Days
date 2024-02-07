//
//  ANN.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

extension UIView {
    func animateViewToRight(of containerView: UIView, duration: TimeInterval) {
        self.center.x = -self.bounds.width / 2
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.center.x = containerView.bounds.midX
        })
    }
}

extension UIView {
    func showToast(toastLabel: UILabel, showDuration: TimeInterval, showDelay: TimeInterval, hideDuration: TimeInterval, hideDelay: TimeInterval) {
        
        UIView.animate(withDuration: showDuration, delay: showDelay, options: .curveEaseIn, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: hideDuration, delay: hideDelay, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {_ in
                toastLabel.removeFromSuperview()
            })
        })
    }
}

extension UITableView {
    func reloadWithAnimation() {
        reloadData()
        let tableViewHeight = bounds.size.height
        let cells = visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
