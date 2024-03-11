//
//  WelcomeView.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

final class WelcomeView: UIView {
    
    private let loginImageView = UIImageView()
    var nameLabel = UILabel()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
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
        
        setupLogoImageView()
        setupNameLabel()
        setupActivityIndicator()
    }
    
    private func setupLogoImageView() {
        loginImageView.contentMode = .scaleAspectFit
        loginImageView.image = UIImage.loginImage
        addSubview(loginImageView)
    }
    
    private func setupNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: UIFont.rooneySansBold, size: 23)
        addSubview(nameLabel)
    }
    
    private func setupActivityIndicator() {
        activityIndicator.color = UIColor.accentColor?.withAlphaComponent(0.5)
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
    }
    
    private func setupConstraints() {
        loginImageView.anchor(top: safeTopAnchor, padding: Padding(top: 180), centerX: centerXAnchor, widthAnchorTo: loginImageView.heightAnchor, heightAnchorTo: heightAnchor, widthMultiplier: 1.0, heightMultiplier: 1.0 / 5.0)
        
        nameLabel.anchor(bottom: activityIndicator.topAnchor, padding: Padding(bottom: 40), centerX: centerXAnchor)
        
        activityIndicator.anchor(bottom: safeBottomAnchor, padding: Padding(bottom: 60), centerX: centerXAnchor)
    }
}
