//
//  ViewController.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/24/24.
//

import UIKit

final class EditHabitViewController: UIViewController {
    
    private let editHabitView = EditHabitView()
    private let editHabitTextFieldDelegate = TextFieldDelegateHandler()
    private var realmManager = RealmManager()
    var habit: Habit?
    private var missHabitFlag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addEditHabitView()
        updateEditHabitView()
        realmManagerHandler()
        editHabitTextFieldDelegateConfig()
        handleKeyboardDismiss()
        cancelButtonSetup()
        saveButtonSetup()
        missHabitButtonSetup()
    }
    
    private func addEditHabitView() {
        view.addSubview(editHabitView)
        editHabitView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func updateEditHabitView() {
        editHabitView.editHabitTextField.text = habit?.title
        editHabitView.missHabitButtonTopConstraint?.constant = SetNameViewController.screenSize / 2 + 50
    }
    
    private func realmManagerHandler() {
        realmManager = RealmManager()
    }
    
    private func editHabitTextFieldDelegateConfig() {
        editHabitView.editHabitTextField.delegate = editHabitTextFieldDelegate
        editHabitView.editHabitTextField.accessibilityIdentifier = "editHabitTextField"
        editHabitTextFieldDelegate.uiHandlerTextChange = self
        editHabitTextFieldDelegate.uiHandlerTextEditing = self
    }
    
    private func handleKeyboardDismiss() {
        addKeyboardDismissTapGesture()
        addDoneButtonToKeyboard(for: editHabitView.editHabitTextField)
    }
    
    private func cancelButtonSetup() {
        editHabitView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func saveButtonSetup() {
        editHabitView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        
        realmManager.updateHabit(habitTitle: habit?.title ?? "", newTitle: editHabitView.editHabitTextField.text ?? "", updateDateCreate: missHabitFlag)
      
        navigationController?.popViewController(animated: true)
    }
    
    private func missHabitButtonSetup() {
        editHabitView.missHabitButton.addTarget(self, action: #selector(missHabitButtonTapped), for: .touchUpInside)
    }
 
    @objc private func missHabitButtonTapped() {
        missHabitFlag = true
        editHabitView.missHabitButton.isEnabled = false
        editHabitView.missHabitButton.backgroundColor = UIColor.accentColor?.withAlphaComponent(0.5)
        editHabitView.missHabitButton.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        editHabitView.showToast(toastLabel: editHabitView.missHabitToastLabel, showDuration: 0.5, showDelay: 0, hideDuration: 0.01, hideDelay: 1)
    }
}

extension EditHabitViewController: TextFieldDelegateUIHandlerTextChange, TextFieldDelegateUIHandlerTextEditing {
    
    func userNameTextFieldDidBeginEditing(textFieldName: String) {
        if textFieldName == "editHabitTextField" {
            editHabitView.missHabitButtonTopConstraint?.constant = 80
            UIView.animate(withDuration: 0.3) {
                self.editHabitView.layoutIfNeeded()
            }
        }
    }
    
    func userNameTextFieldDidEndEditing(textFieldName: String) {
        if textFieldName == "editHabitTextField" {
            editHabitView.missHabitButtonTopConstraint?.constant = SetNameViewController.screenSize / 2 + 50
        }
    }
    
    func userNameTextFieldDidChange(textFieldName: String, isEmpty: Bool) {
        if textFieldName == "editHabitTextField" {
            if isEmpty {
                editHabitView.saveButton.isEnabled = false
                editHabitView.saveButton.setTitleColor(UIColor.accentColor?.withAlphaComponent(0.5), for: .normal)
            }
            else {
                editHabitView.saveButton.isEnabled = true
                editHabitView.saveButton.setTitleColor(UIColor.accentColor, for: .normal)
            }
        }
    }
}
