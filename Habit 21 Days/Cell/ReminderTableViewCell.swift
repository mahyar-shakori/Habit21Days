//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit

final class ReminderTableViewCell: UITableViewCell {
    
    let reminderView = ReminderView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(reminderView)
        addReminderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addReminderView() {
        reminderView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }

    func config(_ reminder: Reminder) {
        reminderView.reminderLabel.text = "\(reminder.reminderTime)"
    }
}
