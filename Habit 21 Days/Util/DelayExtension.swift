//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import Foundation

extension DispatchQueue {
    static func delay(_ seconds: Double, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    }
}
