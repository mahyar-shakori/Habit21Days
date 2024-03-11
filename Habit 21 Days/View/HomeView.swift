//
//  HomeView.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/8/24.
//

import UIKit

final class HomeView: UIView {
    
    let homeTitleLabel = UILabel()
    let quoteLabel = UILabel()
    let doneButton = UIButton()
    let dropDownButton = UIButton()
    let dropDownTableView = UITableView()
    let dropDownTransparentView = UIView()
    let habitTableView = UITableView()
    let addHabitView = UIView()
    let addHabitTextField = UITextField()
    let saveButton = UIButton()
    let habitLibraryTableView = UITableView()
    let emptyView = UIView()
    private let emptyViewImage = UIImageView()
    private let emptyViewLabel = UILabel()
    
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
        
        setupHomeTitleButton()
        setupQuoteLabel()
        setupDoneButton()
        setupDropDownButton()
        setupDropDownTableView()
        setupHabitTableView()
        setupAddHabitView()
        setupAddHabitTextField()
        setupSaveButton()
        setupHabitLibraryTableView()
        setupEmptyView()
        setupEmptyViewImage()
        setupEmptyLabel()
    }
    
    private func setupHomeTitleButton() {
        homeTitleLabel.text = NSLocalizedString("firstHomeTitleLabel", comment: "")
        homeTitleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 28)
        addSubview(homeTitleLabel)
    }
    
    private func setupQuoteLabel() {
        quoteLabel.text = ""
        quoteLabel.numberOfLines = 0
        quoteLabel.textAlignment = .left
        quoteLabel.font = UIFont(name: UIFont.rooneySansRegular, size: 17)
        addSubview(quoteLabel)
    }
    
    private func setupDropDownButton() {
        dropDownButton.setImage(UIImage.dropDownButtonImage?.withColor(UIColor.label), for: .normal)
        dropDownButton.setImage(UIImage.dropDownButtonImage?.withReducedOpacity(0.5), for: .highlighted)
        addSubview(dropDownButton)
    }
    
    private func setupDoneButton() {
        doneButton.setTitle(NSLocalizedString("doneButton", comment: ""), for: .normal)
        doneButton.setTitleColor(UIColor.label, for: .normal)
        doneButton.setTitleColor(UIColor.label.withAlphaComponent(0.5), for: .highlighted)
        doneButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 17)
        addSubview(doneButton)
    }
    
    private func setupDropDownTableView() {
        dropDownTableView.isScrollEnabled = true
        dropDownTableView.register(DropDownTableViewCell.self, forCellReuseIdentifier: "dropDownCell")
        dropDownTableView.layer.cornerRadius = 11.25
    }
    
    private func setupHabitTableView() {
        habitTableView.separatorStyle = .none
        habitTableView.backgroundColor = UIColor.clear
        addSubview(habitTableView)
    }
    
    private func setupAddHabitView() {
        addHabitView.layer.borderWidth = 1
        addHabitView.layer.borderColor = UIColor.accentColor?.cgColor
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
    
    private func setupSaveButton() {
        saveButton.setTitle(NSLocalizedString("saveButton", comment: ""), for: .normal)
        saveButton.setTitleColor(UIColor.accentColor, for: .normal)
        saveButton.setTitleColor(UIColor.accentColor?.withAlphaComponent(0.5), for: .highlighted)
        saveButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 16)
        addSubview(saveButton)
    }
    
    private func setupHabitLibraryTableView() {
        habitLibraryTableView.separatorStyle = .none
        habitLibraryTableView.backgroundColor = UIColor.clear
        addSubview(habitLibraryTableView)
    }
    
    private func setupEmptyView() {
        emptyView.backgroundColor = .clear
        addSubview(emptyView)
        bringSubviewToFront(dropDownButton)
    }
    
    private func setupEmptyViewImage() {
        emptyViewImage.contentMode = .scaleAspectFit
        emptyViewImage.image = UIImage.emptyViewImage
        emptyView.addSubview(emptyViewImage)
    }
    
    private func setupEmptyLabel() {
        emptyViewLabel.text = NSLocalizedString("emptyViewLabel", comment: "")
        emptyViewLabel.numberOfLines = 0
        emptyViewLabel.textAlignment = .center
        emptyViewLabel.font = UIFont(name: UIFont.rooneySansBold, size: 17)
        emptyView.addSubview(emptyViewLabel)
    }
    
    private func setupConstraints() {
        homeTitleLabel.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, padding: Padding(top: 40, left: 30))
        
        quoteLabel.anchor(top: homeTitleLabel.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 25, left: 30, right: 30))
        
        dropDownButton.anchor(trailing: safeTrailingAnchor, padding: Padding(right: 30), centerY: homeTitleLabel.centerYAnchor)
        
        doneButton.anchor(trailing: safeTrailingAnchor, padding: Padding(right: 30), centerY: homeTitleLabel.centerYAnchor)
        
        habitTableView.anchor(top: quoteLabel.bottomAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 15, left: 20, bottom: 0, right: 20))
        
        addHabitView.anchor(top: quoteLabel.bottomAnchor, leading: safeLeadingAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 0, left: 20, right: 80), height: 40)
        
        addHabitTextField.anchor(top: addHabitView.topAnchor, leading: addHabitView.leadingAnchor, bottom: addHabitView.bottomAnchor, trailing: addHabitView.trailingAnchor, padding: Padding(top: 0, left: 10, bottom: 0, right: 10))
        
        saveButton.anchor(trailing: safeTrailingAnchor, padding: Padding(right: 25), centerY: addHabitTextField.centerYAnchor)
        
        habitLibraryTableView.anchor(top: addHabitTextField.bottomAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 15, left: 20, bottom: 0, right: 20))
        
        emptyView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 0, left: 0, bottom: 0, right: 0))
        
        emptyViewImage.anchor(top: emptyView.topAnchor, leading: emptyView.leadingAnchor, trailing: emptyView.trailingAnchor, padding: Padding(top: 140, left: 70, right: 70), centerX: centerXAnchor, widthAnchorTo: emptyViewImage.heightAnchor, heightAnchorTo: heightAnchor, widthMultiplier: 1.0, heightMultiplier: 1.0 / 2.5)
        
        emptyViewLabel.anchor(top: emptyViewImage.bottomAnchor, leading: emptyView.leadingAnchor, trailing: emptyView.trailingAnchor, padding: Padding(top: 0, left: 30, right: 30))
    }
}
