//
//  Intro.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/18/24.
//

import UIKit

final class IntroView: UIView {
    
    var introImageView = UIImageView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    let skipButton = UIButton()
    let nextButton = UIButton()
    var pageControlDot = UIImageView()
    
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
        
        setupIntroImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupSkipButton()
        setupNextButton()
        setupPageControlDot()
    }
    
    private func setupIntroImageView() {
        introImageView.contentMode = .scaleAspectFit
        introImageView.image = UIImage.healtyHabit
        addSubview(introImageView)
    }
    
    private func setupTitleLabel() {
        titleLabel.text = NSLocalizedString("introFirstTitleLabel", comment: "")
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 24)
        addSubview(titleLabel)
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = NSLocalizedString("introFirstDescriptionLabel", comment: "")
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: UIFont.rooneySansRegular, size: 18)
        addSubview(descriptionLabel)
    }
    
    private func setupSkipButton() {
        skipButton.setTitle(NSLocalizedString("skipButton", comment: ""), for: .normal)
        skipButton.setTitleColor(UIColor.accentColor, for: .normal)
        skipButton.setTitleColor(UIColor.accentColor?.withAlphaComponent(0.5), for: .highlighted)
        skipButton.titleLabel?.font = UIFont(name: UIFont.rooneySansRegular, size: 16)
        addSubview(skipButton)
    }
    
    private func setupNextButton() {
        nextButton.setTitle(NSLocalizedString("nextButton", comment: ""), for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.titleLabel?.font = UIFont(name: UIFont.rooneySansBold, size: 18)
        nextButton.normalBackgroundColor = UIColor.accentColor
        nextButton.highlightedBackgroundColor = UIColor.accentColor?.withAlphaComponent(0.5)
        nextButton.addCornerView(corner: 20)
        addSubview(nextButton)
    }
    
    private func setupPageControlDot() {
        pageControlDot.contentMode = .scaleAspectFit
        pageControlDot.image = UIImage.pageControlDot1stImage
        addSubview(pageControlDot)
    }
    
    private func setupConstraints() {
        introImageView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 50, left: 20, bottom: 0, right: 20), centerX: centerXAnchor, widthAnchorTo: introImageView.heightAnchor, heightAnchorTo: heightAnchor, widthMultiplier: 1.0, heightMultiplier: 1.0 / 2.0)
        
        titleLabel.anchor(top: introImageView.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: -30, left: 30, bottom: 0, right: 0))
        
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, leading: safeLeadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 30))
        
        skipButton.anchor(top: nil, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 30, bottom: 50, right: 0))
        
        nextButton.anchor(top: nil, leading: nil, bottom: nil, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30), centerY: skipButton.centerYAnchor)
        nextButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        pageControlDot.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), centerX: centerXAnchor, centerY: skipButton.centerYAnchor)
    }
}
