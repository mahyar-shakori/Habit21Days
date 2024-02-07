//
//  AppDelegate.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NotificationManager.shared.setupNotificationManager()
        
        if Reachability.isConnectedToNetwork() {
            print("Internet Connection Available!")
        }else{
            print("Internet Connection not Available!")
        }
        
        let navController = UINavigationController()
        navController.isNavigationBarHidden = true
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationCenter.default.post(name: NSNotification.Name("AppEnteredForeground"), object: nil)
    }
}
