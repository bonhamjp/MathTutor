//
//  Settings.swift
//  MathTutor
//
//  Created by John on 10/22/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

let DEFAULT_QUIZ_SECONDS: Float = 60.0

class Settings {
    
    var quizSeconds: Float
    
    init() {
        let defaults = UserDefaults.standard
        
        let currentQuizSeconds = defaults.float(forKey: "quizSeconds")
        if currentQuizSeconds != 0.0 {
            self.quizSeconds = currentQuizSeconds
        } else {
            self.quizSeconds = DEFAULT_QUIZ_SECONDS
        }
    }
    
    func store() {
        let defaults = UserDefaults.standard
        
        defaults.set(quizSeconds, forKey: "quizSeconds")
    }
    
}
