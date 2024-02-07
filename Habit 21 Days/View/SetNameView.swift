//
//  SetNameView.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/8/24.
//

import UIKit

final class SetNameView: UIView {
    
    let setNameImageView = UIImageView()
    let hiDialogLabel = UILabel()
    let userNameView = UIView()
    let userNameTextField = UITextField()
    let continueButton = UIButton()
    let errorLabel = UILabel()
    var hiDialogLabelTopConstraint: NSLayoutConstraint?
    var continueButtonTopConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.systemBackground
        
        setupSetNameImageView()
        setupHiDialogLabel()
        setupNameView()
        setupUserNameTextField()
        setupContinueButton()
        setupErrorLabel()
    }
    
    private func setupSetNameImageView() {
        setNameImageView.contentMode = .scaleToFill
        setNameImageView.image = UIImage.setNameImage
        addSubview(setNameImageView)
    }
    
    private func setupHiDialogLabel() {
        hiDialogLabel.text = NSLocalizedString("hiDialogLabel", comment: "")
        hiDialogLabel.numberOfLines = 0
        hiDialogLabel.textAlignment = .center
        hiDialogLabel.font = UIFont(name: UIFont.rooneySansBold, size: 21)
        addSubview(hiDialogLabel)
    }
    
    private func setupNameView() {
        userNameView.layer.borderWidth = 1
        userNameView.layer.borderColor = UIColor.accentColor?.cgColor
        userNameView.addCornerView(corner: 12.5)
        addSubview(userNameView)
    }
    
    private func setupUserNameTextField() {
        userNameTextField.borderStyle = .none
        userNameTextField.placeholder = NSLocalizedString("userNameTextFieldPplaceholder", comment: "")
        userNameTextField.textContentType = .givenName
        userNameTextField.placeholderColor = UIColor.lightGray
        userNameTextField.font = UIFont(name: UIFont.rooneySansRegular, size: 16)
        userNameView.addSubview(userNameTextField)
    }
    
    private func setupContinueButton() {
        continueButton.setTitle(NSLocalizedString("continueButton", comment: ""), for: .normal)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 20)
        continueButton.normalBackgroundColor = UIColor.accentColor?.withAlphaComponent(0.5)
        continueButton.highlightedBackgroundColor = UIColor.accentColor?.withAlphaComponent(0.5)
        continueButton.addCornerView(corner: 12.5)
        addSubview(continueButton)
    }
    
    private func setupErrorLabel() {
        errorLabel.text = NSLocalizedString("errorLabel", comment: "")
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.font = UIFont(name: UIFont.rooneySansRegular, size: 15)
        errorLabel.textColor = UIColor.red
        addSubview(errorLabel)
    }
    
    private func setupConstraints() {
        setNameImageView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), centerX: centerXAnchor, widthAnchorTo: setNameImageView.heightAnchor, heightAnchorTo: heightAnchor, widthMultiplier: 1.0, heightMultiplier: 1.0 / 2.5)
        
        hiDialogLabelTopConstraint = hiDialogLabel.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0))
        
        userNameView.anchor(top: hiDialogLabel.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 30, left: 30, bottom: 0, right: 30))
        userNameView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        userNameTextField.anchor(top: userNameView.topAnchor, leading: userNameView.leadingAnchor, bottom: userNameView.bottomAnchor, trailing: userNameView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
        
        continueButtonTopConstraint = continueButton.anchor(top: userNameView.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30))
        continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        errorLabel.anchor(top: userNameView.bottomAnchor, leading: continueButton.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }
}
