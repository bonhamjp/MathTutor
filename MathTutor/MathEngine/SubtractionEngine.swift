//
//  AdditionEngine.swift
//  MathTutor
//
//  Created by John on 10/16/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

let MIN_MINUEND: Float = 1.0
let MAX_MINUEND: Float = 200.0

class SubtractionEngine : MathEngine {
    
    override func generateEquation() -> MathEquation {
        let randomLHand = Float(arc4random_uniform(UInt32(Int(MAX_MINUEND) - Int(MIN_MINUEND)))) + MIN_MINUEND
        let randomRHand = Float(arc4random_uniform(UInt32(Int(MAX_MINUEND) - Int(MIN_MINUEND)))) + MIN_MINUEND
        
        let solution = randomLHand - randomRHand
        
        return MathEquation(
            lHandSide: randomLHand,
            rHandSide: randomRHand,
            solution: solution
        )
    }
    
    override func operatorDisplay() -> String {
        return "-"
    }
    
    override func mathType() -> MathType {
        return .subtraction
    }
    
}
