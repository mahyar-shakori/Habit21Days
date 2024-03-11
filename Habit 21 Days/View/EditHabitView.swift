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
    private let editHabitView = UIView()
    let editHabitTextField = UITextField()
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
        backgroundColor = UIColor.appBackgroundColor
        
        setupEditHabitTitleLabel()
        setupSaveButton()
        setupCancelButton()
        setupEditHabitView()
        setupEditHabitTextField()
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
        editHabitView.backgroundColor = UIColor.appCellColor
        editHabitView.addCornerView(corner: 12.5)
        addSubview(editHabitView)
    }
    
    private func setupEditHabitTextField() {
        editHabitTextField.borderStyle = .none
        editHabitTextField.placeholderColor = UIColor.lightGray
        editHabitTextField.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        editHabitView.addSubview(editHabitTextField)
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
        editHabitTitleLabel.anchor(top: safeTopAnchor, padding: Padding(top: 40), centerX: centerXAnchor)
        
        saveButton.anchor(trailing: safeTrailingAnchor, padding: Padding(right: 30), centerY: editHabitTitleLabel.centerYAnchor)
        
        cancelButton.anchor(leading: safeLeadingAnchor, padding: Padding(left: 30), centerY: editHabitTitleLabel.centerYAnchor)
        
        editHabitView.anchor(top: editHabitTitleLabel.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 50, left: 20, right: 20), height: 50)
        
        editHabitTextField.anchor(top: editHabitView.topAnchor, leading: editHabitView.leadingAnchor, bottom: editHabitView.bottomAnchor, trailing: editHabitView.trailingAnchor, padding: Padding(top: 0, left: 15, bottom: 0, right: 15))
        
        missHabitToastLabel.anchor(top: editHabitView.bottomAnchor, padding: Padding(top: 30), centerX: centerXAnchor)
        
        missHabitButtonTopConstraint = missHabitButton.anchor(top: editHabitView.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 0 , left: 30, right: 30), height: 50)
    }
}
