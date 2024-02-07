//
//  UserDefaultsManager.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/7/24.
//

import Foundation

final class UserDefaultsManager {
    
    enum keys: String {
        case userName = "userName"
        case isLogin = "isLogin"
        case isQuoteOff = "isQuoteOff"
    }
    
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    func setUserNameValue(value: String, key: keys) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func getUserNameValue() -> String? {
        userDefaults.string(forKey: keys.userName.rawValue)
    }
    
    var isLogin: Bool {
        get {
            userDefaults.bool(forKey: keys.isLogin.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: keys.isLogin.rawValue)
        }
    }
    
    var isQuoteOff: Bool {
        get {
            userDefaults.bool(forKey: keys.isQuoteOff.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: keys.isQuoteOff.rawValue)
        }
    }
}
