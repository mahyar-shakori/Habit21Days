//
//  AddHabitView.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/11/24.
//

import UIKit

final class AddHabitView: UIView {
    
    private let addHabitTitleLabel = UILabel()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    private let firstSeparator = SeparatorLine()
    private let addHabitView = UIView()
    let addHabitTextField = UITextField()
    private let secondSeparator = SeparatorLine()
    private let stackView = UIStackView()
    private let thirdSeparator = SeparatorLine()
    private let reminderView = UIView()
    private let reminderLabel = UILabel()
    let reminderSwitch = UISwitch()
    let fourthSeparator = SeparatorLine()
    let dateView = UIView()
    let dateLabel = UILabel()
    let dateTextField = UITextField()
    let fifthSeparator = SeparatorLine()
    let addReminderView = UIView()
    let addReminderButton = UIButton()
    private let sixthSeparator = SeparatorLine()
    let reminderTableView = UITableView()
    var sixthSeparatorTopConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.systemGray6
        
        setupAddHabitTitleLabel()
        setupSaveButton()
        setupCancelButton()
        setupAddHabitView()
        setupAddHabitTextField()
        setupReminderView()
        setupReminderLabel()
        setupReminderSwitch()
        setupDateView()
        setupDateLabel()
        setupDateTextField()
        setupAddReminderView()
        setupAddReminderButton()
        setupSeparators()
        setupReminderTableView()
    }
    
    private func setupAddHabitTitleLabel() {
        addHabitTitleLabel.text = NSLocalizedString("addHabitTitleLabel", comment: "")
        addHabitTitleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 17)
        addSubview(addHabitTitleLabel)
    }
    
    private func setupSaveButton() {
        saveButton.setTitle(NSLocalizedString("saveButton", comment: ""), for: .normal)
        saveButton.setTitleColor(UIColor.accentColor?.withAlphaComponent(0.5), for: .highlighted)
        saveButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 16)
        addSubview(saveButton)
    }
    
    private func setupCancelButton() {
        cancelButton.setTitle(NSLocalizedString("cancelButton", comment: ""), for: .normal)
        cancelButton.setTitleColor(UIColor.accentColor, for: .normal)
        cancelButton.setTitleColor(UIColor.accentColor?.withAlphaComponent(0.5), for: .highlighted)
        cancelButton.titleLabel?.font = UIFont(name: UIFont.rooneySansRegular, size: 16)
        addSubview(cancelButton)
    }
    
    private func setupAddHabitView() {
        addHabitView.backgroundColor = UIColor.systemBackground
        addSubview(addHabitView)
    }
    
    private func setupAddHabitTextField() {
        addHabitTextField.borderStyle = .none
        addHabitTextField.placeholder = NSLocalizedString("addHabitTextFieldPlaceholder", comment: "")
        addHabitTextField.placeholderColor = UIColor.lightGray
        addHabitTextField.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        addHabitView.addSubview(addHabitTextField)
    }
    
    private func setupReminderView() {
        reminderView.backgroundColor = UIColor.systemBackground
        addSubview(reminderView)
    }
    
    private func setupReminderLabel() {
        reminderLabel.text = NSLocalizedString("reminderLabel", comment: "")
        reminderLabel.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        reminderView.addSubview(reminderLabel)
    }
    
    private func setupReminderSwitch() {
        reminderView.addSubview(reminderSwitch)
    }
    
    private func setupDateView() {
        dateView.backgroundColor = UIColor.systemBackground
        addSubview(dateView)
    }
    
    private func setupDateLabel() {
        dateLabel.text = NSLocalizedString("dateLabel", comment: "")
        dateLabel.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        dateView.addSubview(dateLabel)
    }
    
    private func setupDateTextField() {
        dateTextField.borderStyle = .none
        dateTextField.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        dateView.addSubview(dateTextField)
    }
    
    private func setupAddReminderView() {
        addReminderView.backgroundColor = UIColor.systemBackground
        addSubview(addReminderView)
    }
    
    private func setupAddReminderButton() {
        addReminderButton.setTitle(NSLocalizedString("addReminderButton", comment: ""), for: .normal)
        addReminderButton.setTitleColor(UIColor.label.withAlphaComponent(0.5), for: .highlighted)
        addReminderButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 17)
        addReminderView.addSubview(addReminderButton)
    }
    
    private func setupSeparators() {
        addSubview(firstSeparator)
        addSubview(secondSeparator)
        addSubview(thirdSeparator)
        addSubview(fourthSeparator)
        addSubview(fifthSeparator)
        addSubview(sixthSeparator)
    }
    
    private func setupReminderTableView() {
        reminderTableView.separatorStyle = .none
        reminderTableView.backgroundColor = UIColor.clear
        addSubview(reminderTableView)
    }
    
    private func setupConstraints() {
        addHabitTitleLabel.anchor(top: safeTopAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0), centerX: centerXAnchor)
        
        saveButton.anchor(top: nil, leading: nil, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30), centerY: addHabitTitleLabel.centerYAnchor)
        
        cancelButton.anchor(top: nil, leading: safeLeadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0), centerY: addHabitTitleLabel.centerYAnchor)
        
        firstSeparator.anchor(top: nil, leading: safeLeadingAnchor, bottom: addHabitView.topAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        addHabitView.anchor(top: addHabitTitleLabel.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
        addHabitView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addHabitTextField.anchor(top: addHabitView.topAnchor, leading: addHabitView.leadingAnchor, bottom: addHabitView.bottomAnchor, trailing: addHabitView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        
        secondSeparator.anchor(top: addHabitView.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        thirdSeparator.anchor(top: nil, leading: safeLeadingAnchor, bottom: reminderView.topAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        reminderView.anchor(top: addHabitView.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0))
        reminderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        reminderLabel.anchor(top: nil, leading: reminderView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), centerY: reminderView.centerYAnchor)
        
        reminderSwitch.anchor(top: nil, leading: nil, bottom: nil, trailing: reminderView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15), centerY: reminderView.centerYAnchor)
        
        fourthSeparator.anchor(top: nil, leading: safeLeadingAnchor, bottom: reminderView.bottomAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0))
        
        dateView.anchor(top: fourthSeparator.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        dateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        dateLabel.anchor(top: nil, leading: dateView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), centerY: dateView.centerYAnchor)
        
        dateTextField.anchor(top: nil, leading: dateView.leadingAnchor, bottom: nil, trailing: dateView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15), centerY: dateView.centerYAnchor)
        
        fifthSeparator.anchor(top: nil, leading: safeLeadingAnchor, bottom: dateView.bottomAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0))
        
        addReminderView.anchor(top: fifthSeparator.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        addReminderView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addReminderButton.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), centerX: addReminderView.centerXAnchor, centerY: addReminderView.centerYAnchor)
        
        sixthSeparatorTopConstraint = sixthSeparator.anchor(top: reminderView.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        reminderTableView.anchor(top: sixthSeparator.bottomAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
    }
}
