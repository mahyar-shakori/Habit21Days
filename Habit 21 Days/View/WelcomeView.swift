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
        backgroundColor = UIColor.systemBackground
        
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
        loginImageView.anchor(top: safeTopAnchor, leading: nil, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 180, left: 0, bottom: 0, right: 0), centerX: centerXAnchor, widthAnchorTo: loginImageView.heightAnchor, heightAnchorTo: heightAnchor, widthMultiplier: 1.0, heightMultiplier: 1.0 / 5.0)
        
        nameLabel.anchor(top: nil, leading: nil, bottom: activityIndicator.topAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0), centerX: centerXAnchor)
        
        activityIndicator.anchor(top: nil, leading: nil, bottom: safeBottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 60, right: 0), centerX: centerXAnchor)
    }
}
