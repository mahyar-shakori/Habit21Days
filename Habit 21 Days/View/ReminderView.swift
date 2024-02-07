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
        self.backgroundColor = UIColor.systemGray6
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
        reminderCellView.backgroundColor = UIColor.systemBackground
        reminderCellView.addCornerView(corner: 10)
        addSubview(reminderCellView)
    }
    
    private func setupReminderLabel() {
        reminderLabel.numberOfLines = 0
        reminderLabel.font = UIFont(name: UIFont.rooneySansBold, size: 20)
        reminderCellView.addSubview(reminderLabel)
    }
    
    private func setupConstraints() {
        reminderCellView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20))
        reminderCellView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        reminderLabel.anchor(top: nil, leading: reminderCellView.safeLeadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), centerY: reminderCellView.centerYAnchor)
    }
}
