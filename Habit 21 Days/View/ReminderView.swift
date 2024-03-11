//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/17/24.
//

import UIKit

final class ReminderView: UIView {
    
    private let reminderCellView = UIView()
    let reminderLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        self.backgroundColor = UIColor.appBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.clear
        
        setupReminderCellView()
        setupReminderLabel()
    }
    
    private func setupReminderCellView() {
        reminderCellView.backgroundColor = UIColor.appCellColor
        reminderCellView.addCornerView(corner: 10)
        addSubview(reminderCellView)
    }
    
    private func setupReminderLabel() {
        reminderLabel.numberOfLines = 0
        reminderLabel.font = UIFont(name: UIFont.rooneySansBold, size: 20)
        reminderCellView.addSubview(reminderLabel)
    }
    
    private func setupConstraints() {
        reminderCellView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 5, left: 0, bottom: 5, right: 0), height: 50)
        
        reminderLabel.anchor(leading: reminderCellView.safeLeadingAnchor, padding: Padding(left: 15), centerY: reminderCellView.centerYAnchor)
    }
}
