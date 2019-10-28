//
//  Countdown.swift
//  MathTutor
//
//  Created by John on 10/23/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

class Countdown {
    
    let targetTime: Double
    var startTime: Double
    var elapsedTime: Double
    
    init(targetTime: Double) {
        self.targetTime = targetTime
        
        startTime = 0.0
        elapsedTime = 0.0
    }
    
    func start() {
        startTime = CFAbsoluteTimeGetCurrent()
        elapsedTime = 0.0
    }
    
    func update() {
        elapsedTime = CFAbsoluteTimeGetCurrent() - startTime
    }
    
    func percentComplete() -> Double {
        return elapsedTime / targetTime
    }
    
    func timeExpired() -> Bool {
        return elapsedTime >= targetTime
    }
    
}
