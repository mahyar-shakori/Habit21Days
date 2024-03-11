//
//  ViewController.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/18/24.
//

import UIKit

final class IntroViewController: UIViewController {
    
    private let introView = IntroView()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSetNameView()
        skipButtonTappedSetup()
        nextButtonTappedSetup()
    }
    
    private func addSetNameView() {
        view.addSubview(introView)
        introView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func skipButtonTappedSetup() {
        introView.skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    
    @objc private func skipButtonTapped() {
        coordinator?.navigateToSetNamePage()
    }
    
    private func nextButtonTappedSetup() {
        introView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc private func nextButtonTapped() {
        if introView.introImageView.image == UIImage.healtyHabit {
            introView.introImageView.image = UIImage.badHabit
            introView.titleLabel.text = NSLocalizedString("introSecondTitleLabel", comment: "")
            introView.descriptionLabel.text = NSLocalizedString("introSecondDescriptionLabel", comment: "")
            introView.skipButton.isHidden = true
            introView.pageControlDot.image = UIImage.pageControlDot2ndImage
        } else {
            coordinator?.navigateToSetNamePage()
        }
    }
}
