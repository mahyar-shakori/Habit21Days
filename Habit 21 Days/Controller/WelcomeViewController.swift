//
//  WelcomeViewController.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let welcomeView = WelcomeView()
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWelcomeView()
        updateWelcomeView()
        animateLabel()
        callGetQuoteAPI()
    }
    
    private func addWelcomeView() {
        welcomeView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeView)
        
        NSLayoutConstraint.activate([
            welcomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            welcomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            welcomeView.topAnchor.constraint(equalTo: view.topAnchor),
            welcomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateWelcomeView() {
        welcomeView.nameLabel.text = "Welcome, \(UserDefaultsManager.shared.getUserNameValue() ?? "")"
        
        welcomeView.nameLabel.text = NSLocalizedString("welcomeLabel", comment: "") + (UserDefaultsManager.shared.getUserNameValue() ?? "")
    }
    
    private func animateLabel() {
        DispatchQueue.main.async {
            self.welcomeView.nameLabel.animateViewToRight(of: self.view, duration: 1.5)
        }
    }
    
    private func passQuoteResponseText(quote: String) {
        QuoteData.shared.quote = quote
    }
    
    private func stopIndicatorAnimating() {
        welcomeView.activityIndicator.stopAnimating()
    }
}

extension WelcomeViewController: AlertDisplay {
    
    private func callGetQuoteAPI() {
        if UserDefaultsManager.shared.isQuoteOff {
            DispatchQueue.main.async {
                DispatchQueue.delay(1.4) {
                    self.coordinator?.navigateToHomePage()
                }
            }
        } else {
            let networkAPI = NetworkAPI()
            networkAPI.fetchData(from: AuthEndpoint.getQuote, decodeType: [QuoteResponse].self, success: { quoteResponses in
                if let firstQuoteResponse = quoteResponses.first {
                    self.passQuoteResponseText(quote: firstQuoteResponse.quote)
                }
                self.stopIndicatorAnimating()
                self.coordinator?.navigateToHomePage()
            }, failure: { error in
                DispatchQueue.delay(0.5) {
                    self.stopIndicatorAnimating()
                    self.showAlert(title: NSLocalizedString("networkAlertTitle", comment: ""), message: "\(error.localizedDescription)", primaryButtonTitle: NSLocalizedString("alertOkButton", comment: ""), primaryAction: {
                        self.coordinator?.navigateToHomePage()
                    }, secondaryButtonTitle: nil, secondaryAction: nil)
                }
            })
        }
    }
}
