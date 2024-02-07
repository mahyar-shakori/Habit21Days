//
//  SetNameViewController.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/8/24.
//

import UIKit

final class SetNameViewController: UIViewController {
    
    private let setNameView = SetNameView()
    private let userNameTextFieldDelegate = TextFieldDelegate()
    public static let screenSize = UIScreen.main.bounds.maxY
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSetNameView()
        updateNameView()
        userNameTextFieldDelegateConfig()
        handleKeyboardDismiss()
        continueButtonTappedSetup()
    }
    
    private func addSetNameView() {
        setNameView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(setNameView)
        
        NSLayoutConstraint.activate([
            setNameView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            setNameView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            setNameView.topAnchor.constraint(equalTo: view.topAnchor),
            setNameView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateNameView() {
        setNameView.errorLabel.isHidden = true
        setNameView.hiDialogLabelTopConstraint?.constant = SetNameViewController.screenSize / 2
        setNameView.continueButtonTopConstraint?.constant = 90
    }
    
    private func userNameTextFieldDelegateConfig() {
        setNameView.userNameTextField.delegate = userNameTextFieldDelegate
        setNameView.userNameTextField.accessibilityIdentifier = "userNameTextField"
        userNameTextFieldDelegate.uiHandlerTextChange = self
        userNameTextFieldDelegate.uiHandlerTextEditing = self
    }
    
    private func handleKeyboardDismiss() {
        addKeyboardDismissTapGesture()
        addDoneButtonToKeyboard(for: setNameView.userNameTextField)
    }
    
    private func continueButtonTappedSetup() {
        setNameView.continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    @objc private func continueButtonTapped() {
        
        if (setNameView.userNameTextField.text?.isEmpty == true) {
            setNameView.errorLabel.isHidden = false
            setNameView.userNameView.layer.borderWidth = 2
            setNameView.userNameView.layer.borderColor = UIColor.red.cgColor
            return
        } else {
            UserDefaultsManager.shared.setUserNameValue(value: setNameView.userNameTextField.text ?? "", key: .userName)
            UserDefaultsManager.shared.isLogin = true
        }
        coordinator?.navigateToWelcomePage()
    }
}

extension SetNameViewController: TextFieldDelegateUIHandlerTextEditing, TextFieldDelegateUIHandlerTextChange {
    
    func userNameTextFieldDidBeginEditing(textFieldName: String) {
        if textFieldName == "userNameTextField" {
            setNameView.setNameImageView.isHidden = true
            setNameView.hiDialogLabelTopConstraint?.constant = SetNameViewController.screenSize / 10
            setNameView.continueButtonTopConstraint?.constant = 50
            UIView.animate(withDuration: 0.3) {
                self.setNameView.layoutIfNeeded()
            }
        }
    }
    
    func userNameTextFieldDidEndEditing(textFieldName: String) {
        if textFieldName == "userNameTextField" {
            setNameView.setNameImageView.isHidden = false
            setNameView.hiDialogLabelTopConstraint?.constant = SetNameViewController.screenSize / 2
            setNameView.continueButtonTopConstraint?.constant = 90
        }
    }
    
    func userNameTextFieldDidChange(textFieldName: String, isEmpty: Bool) {
        if textFieldName == "userNameTextField" {
            if isEmpty {
                setNameView.errorLabel.isHidden = true
                setNameView.continueButton.backgroundColor = UIColor.accentColor?.withAlphaComponent(0.5)
                setNameView.userNameView.layer.borderWidth = 1
                setNameView.userNameView.layer.borderColor = UIColor.accentColor?.cgColor
            }
            else {
                setNameView.errorLabel.isHidden = true
                setNameView.continueButton.backgroundColor = UIColor.accentColor
                setNameView.userNameView.layer.borderWidth = 1
                setNameView.userNameView.layer.borderColor = UIColor.accentColor?.cgColor
            }
        }
    }
}
