//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/28/24.
//

import UIKit
import UserNotifications

final class NotificationManager: NSObject {
    
    private let notificationCenter = UNUserNotificationCenter.current()
    private let formatter = DateFormatter()
    
    static let shared = NotificationManager()
    
    private override init() {
        super.init()
    }
    
    func setupNotificationManager() {
        notificationCenter.delegate = self
        requestAuthorization()
    }
    
    private func requestAuthorization() {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                debugPrint("User gave permissions for local notifications")
            } else if let error = error {
                debugPrint("Authorization Error: \(error.localizedDescription)")
            }
        }
    }
    
    func setNotification(identifier: String, title: String, message: String, date: Date) {
        notificationCenter.getNotificationSettings { [weak self] settings in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                if settings.authorizationStatus == .authorized {
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.body = message
                    content.sound = .default
                    
                    let dateComp = Calendar.current.dateComponents([.hour, .minute], from: date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: true)
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    
                    self.notificationCenter.add(request) { error in
                        if let error = error {
                            debugPrint("Error: \(error.localizedDescription)")
                        }
                    }
                    debugPrint("Notification set for: \(self.notificationFormattedDate(date: date))")
                }
            }
        }
    }
    
    private func notificationFormattedDate(date: Date) -> String {
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func cancelNotification(identifier: String) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    func checkNotificationAuthorization(completion: @escaping (_ authorized: Bool) -> Void) {
        notificationCenter.getNotificationSettings { settings in
            DispatchQueue.main.async {
                completion(settings.authorizationStatus == .authorized)
            }
        }
    }
    
    func promptForNotificationAuthorization(on viewController: AlertDisplay) {
        viewController.showAlert(
            title: "Enable Notifications",
            message: "To use this feature you must enable notifications in settings",
            primaryButtonTitle: "Settings",
            primaryAction: {
                guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsURL) {
                    UIApplication.shared.open(settingsURL)
                }
            },
            secondaryButtonTitle: "Cancel",
            secondaryAction: nil
        )
    }
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
