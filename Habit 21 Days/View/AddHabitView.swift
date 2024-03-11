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
    private let addHabitView = UIView()
    let addHabitTextField = UITextField()
    private let stackView = UIStackView()
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
    let reminderTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.appBackgroundColor
        
        setupAddHabitTitleLabel()
        setupSaveButton()
        setupCancelButton()
        setupAddHabitView()
        setupAddHabitTextField()
        setupStackView()
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
        addHabitView.backgroundColor = UIColor.appCellColor
        addHabitView.addCornerView(corner: 12.5)
        addSubview(addHabitView)
    }
    
    private func setupAddHabitTextField() {
        addHabitTextField.borderStyle = .none
        addHabitTextField.placeholder = NSLocalizedString("addHabitTextFieldPlaceholder", comment: "")
        addHabitTextField.placeholderColor = UIColor.lightGray
        addHabitTextField.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        addHabitView.addSubview(addHabitTextField)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.addCornerView(corner: 12.5)
        stackView.addArrangedSubview(reminderView)
        stackView.addArrangedSubview(fourthSeparator)
        stackView.addArrangedSubview(dateView)
        stackView.addArrangedSubview(fifthSeparator)
        stackView.addArrangedSubview(addReminderView)
        addSubview(stackView)
    }
    
    private func setupReminderView() {
        reminderView.backgroundColor = UIColor.appCellColor
        stackView.addSubview(reminderView)
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
        dateView.backgroundColor = UIColor.appCellColor
        stackView.addSubview(dateView)
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
        addReminderView.backgroundColor = UIColor.appCellColor
        stackView.addSubview(addReminderView)
    }
    
    private func setupAddReminderButton() {
        addReminderButton.setTitle(NSLocalizedString("addReminderButton", comment: ""), for: .normal)
        addReminderButton.setTitleColor(UIColor.label.withAlphaComponent(0.5), for: .highlighted)
        addReminderButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 17)
        addReminderView.addSubview(addReminderButton)
    }
    
    private func setupSeparators() {
        addSubview(fourthSeparator)
        addSubview(fifthSeparator)
    }
    
    private func setupReminderTableView() {
        reminderTableView.separatorStyle = .none
        reminderTableView.backgroundColor = UIColor.clear
        addSubview(reminderTableView)
    }
    
    private func setupConstraints() {
        addHabitTitleLabel.anchor(top: safeTopAnchor, padding: Padding(top: 40), centerX: centerXAnchor)
        
        saveButton.anchor(trailing: safeTrailingAnchor, padding: Padding(right: 30), centerY: addHabitTitleLabel.centerYAnchor)
        
        cancelButton.anchor(leading: safeLeadingAnchor, padding: Padding(left: 30), centerY: addHabitTitleLabel.centerYAnchor)
                
        addHabitView.anchor(top: addHabitTitleLabel.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 50, left: 20, right: 20), height: 50)
        
        addHabitTextField.anchor(top: addHabitView.topAnchor, leading: addHabitView.leadingAnchor, bottom: addHabitView.bottomAnchor, trailing: addHabitView.trailingAnchor, padding: Padding(top: 0, left: 15, bottom: 0, right: 15))
                
        stackView.anchor(leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(left: 20, right: 20))
                
        reminderView.anchor(top: addHabitView.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 25, left: 20, right: 20), height: 50)
        
        reminderLabel.anchor(leading: reminderView.leadingAnchor, padding: Padding(left: 15), centerY: reminderView.centerYAnchor)
        
        reminderSwitch.anchor(trailing: reminderView.trailingAnchor, padding: Padding(right: 15), centerY: reminderView.centerYAnchor)
        
        fourthSeparator.anchor(leading: safeLeadingAnchor, bottom: reminderView.bottomAnchor, trailing: safeTrailingAnchor, padding: Padding(left: 35, bottom: 0, right: 20))
        
        dateView.anchor(top: fourthSeparator.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 0, left: 20, right: 20), height: 50)
        
        dateLabel.anchor(leading: dateView.leadingAnchor, padding: Padding(left: 15), centerY: dateView.centerYAnchor)
        
        dateTextField.anchor(leading: dateView.leadingAnchor, trailing: dateView.trailingAnchor, padding: Padding(left: 15, right: 15), centerY: dateView.centerYAnchor)
        
        fifthSeparator.anchor(leading: safeLeadingAnchor, bottom: dateView.bottomAnchor, trailing: safeTrailingAnchor, padding: Padding(left: 35, bottom: 0, right: 20))
        
        addReminderView.anchor(top: fifthSeparator.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 0, left: 20, right: 20), height: 50)
        
        addReminderButton.anchor(centerX: addReminderView.centerXAnchor, centerY: addReminderView.centerYAnchor)
                
        reminderTableView.anchor(top: addReminderView.bottomAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 20, left: 20, bottom: 0, right: 20))
    }
}
