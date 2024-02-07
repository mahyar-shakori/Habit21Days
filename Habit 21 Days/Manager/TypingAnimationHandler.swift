//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit
import AudioToolbox

final class TypingAnimationHandler {
    
    func animateTyping(for label: UILabel, withText text: String, audioSoundID: SystemSoundID, typingDelay: TimeInterval ,completion: @escaping () -> Void) {
        label.text = ""
        for character in text {
            AudioServicesPlaySystemSound(audioSoundID)
            label.text? += "\(character)"
            RunLoop.current.run(until: Date() + typingDelay)
        }
        completion()
    }
}
