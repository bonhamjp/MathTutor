//
//  DivisionEngine.swift
//  MathTutor
//
//  Created by John on 10/20/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

let MIN_SOLUTION: Float = 2.0
let MAX_SOLUTION: Float = 30.0
let MIN_DIVISOR: Float = 2.0
let MAX_DIVISOR: Float = 10.0

class DivisionEngine : MathEngine {
    
    override func generateEquation() -> MathEquation {
        let randomSolution = Float(arc4random_uniform(UInt32(Int(MAX_SOLUTION) - Int(MIN_SOLUTION)))) + MIN_SOLUTION
        let randomDivisor = Float(arc4random_uniform(UInt32(Int(MAX_DIVISOR) - Int(MIN_DIVISOR)))) + MIN_DIVISOR

        let dividend = randomSolution * randomDivisor
        
        return MathEquation(
            lHandSide: dividend,
            rHandSide: randomDivisor,
            solution: randomSolution
        )
    }
    
    override func operatorDisplay() -> String {
        return "/"
    }
    
    override func mathType() -> MathType {
        return .division
    }
    
}
