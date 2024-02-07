//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/24/24.
//

import UIKit

final class EditHabitView: UIView {
    
    private let editHabitTitleLabel = UILabel()
    let saveButton = UIButton()
    let cancelButton = UIButton()
    private let firstSeparator = SeparatorLine()
    private let editHabitView = UIView()
    let editHabitTextField = UITextField()
    private let secondSeparator = SeparatorLine()
    let missHabitToastLabel = UILabel()
    let missHabitButton = UIButton()
    var missHabitButtonTopConstraint: NSLayoutConstraint?
    
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
        
        setupEditHabitTitleLabel()
        setupSaveButton()
        setupCancelButton()
        setupEditHabitView()
        setupEditHabitTextField()
        setupSeparators()
        setupMissHabitToastLabel()
        setupMissHabitButton()
    }
    
    private func setupEditHabitTitleLabel() {
        editHabitTitleLabel.text = NSLocalizedString("editHabitTitleLabel", comment: "")
        editHabitTitleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 17)
        addSubview(editHabitTitleLabel)
    }
    
    private func setupSaveButton() {
        saveButton.setTitle(NSLocalizedString("saveButton", comment: ""), for: .normal)
        saveButton.setTitleColor(UIColor.accentColor, for: .normal)
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
    
    private func setupEditHabitView() {
        editHabitView.backgroundColor = UIColor.systemBackground
        addSubview(editHabitView)
    }
    
    private func setupEditHabitTextField() {
        editHabitTextField.borderStyle = .none
        editHabitTextField.placeholderColor = UIColor.lightGray
        editHabitTextField.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        editHabitView.addSubview(editHabitTextField)
    }
    
    private func setupSeparators() {
        addSubview(firstSeparator)
        addSubview(secondSeparator)
    }
    
    private func setupMissHabitToastLabel() {
        missHabitToastLabel.text = NSLocalizedString("missHabitToastLabel", comment: "")
        missHabitToastLabel.font = UIFont(name: UIFont.rooneySansBold, size: 20)
        missHabitToastLabel.textAlignment = .center
        missHabitToastLabel.alpha = 0
        missHabitToastLabel.layer.cornerRadius = 10
        missHabitToastLabel.clipsToBounds = true
        addSubview(missHabitToastLabel)
    }
    
    private func setupMissHabitButton() {
        missHabitButton.setTitle(NSLocalizedString("missHabitButton", comment: ""), for: .normal)
        missHabitButton.setTitleColor(UIColor.white, for: .normal)
        missHabitButton.normalBackgroundColor = UIColor.accentColor
        missHabitButton.highlightedBackgroundColor = UIColor.accentColor?.withAlphaComponent(0.5)
        missHabitButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 18)
        missHabitButton.addCornerView(corner: 20)
        addSubview(missHabitButton)
    }
    
    private func setupConstraints() {
        editHabitTitleLabel.anchor(top: safeTopAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0), centerX: centerXAnchor)
        
        saveButton.anchor(top: nil, leading: nil, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30), centerY: editHabitTitleLabel.centerYAnchor)
        
        cancelButton.anchor(top: nil, leading: safeLeadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0), centerY: editHabitTitleLabel.centerYAnchor)
        
        firstSeparator.anchor(top: nil, leading: safeLeadingAnchor, bottom: editHabitView.topAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        editHabitView.anchor(top: editHabitTitleLabel.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0))
        editHabitView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        editHabitTextField.anchor(top: editHabitView.topAnchor, leading: editHabitView.leadingAnchor, bottom: editHabitView.bottomAnchor, trailing: editHabitView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
        
        secondSeparator.anchor(top: editHabitView.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        missHabitToastLabel.anchor(top: secondSeparator.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0), centerX: centerXAnchor)
        
        missHabitButtonTopConstraint = missHabitButton.anchor(top: secondSeparator.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0 , left: 30, bottom: 0, right: 30))
        missHabitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
