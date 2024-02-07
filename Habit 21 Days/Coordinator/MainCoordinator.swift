//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/7/24.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func fullScreenNavigate(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        navigationController?.show(viewController, sender: nil)
    }
    
    func start() {
        if UserDefaultsManager.shared.isLogin {
            navigateToHomePage()
        } else {
            navigateToHomePage()
        }
    }
    
    func navigateToIntroPage() {
        let introVc = IntroViewController()
        introVc.coordinator = self
        fullScreenNavigate(introVc)
    }
    
    func navigateToSetNamePage() {
        let setNameVc = SetNameViewController()
        setNameVc.coordinator = self
        fullScreenNavigate(setNameVc)
    }
    
    func navigateToWelcomePage() {
        let welcomeVc = WelcomeViewController()
        welcomeVc.coordinator = self
        fullScreenNavigate(welcomeVc)
    }
    
    func navigateToHomePage() {
        let homeVc = HomeViewController()
        homeVc.coordinator = self
        fullScreenNavigate(homeVc)
    }
    
    func navigateToAddHabitPage() {
        let addHabitVc = AddHabitViewController()
        fullScreenNavigate(addHabitVc)
    }
    
    func navigateToEditHabitPage(withHabit selectedHabit: Habit? = nil) {
        let editHabitVc = EditHabitViewController()
        editHabitVc.habit = selectedHabit
        fullScreenNavigate(editHabitVc)
    }
}
