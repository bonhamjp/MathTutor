//
//  MultiplicationEngine.swift
//  MathTutor
//
//  Created by John on 10/20/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

let MIN_FACTOR: Float = 2.0
let MAX_FACTOR: Float = 30.0

class MultiplicationEngine : MathEngine {
    
    override func generateEquation() -> MathEquation {
        let randomLHand = Float(arc4random_uniform(UInt32(Int(MAX_FACTOR) - Int(MIN_FACTOR)))) + MIN_FACTOR
        let randomRHand = Float(arc4random_uniform(UInt32(Int(MAX_FACTOR) - Int(MIN_FACTOR)))) + MIN_FACTOR

        let solution = randomLHand * randomRHand
        
        return MathEquation(
            lHandSide: randomLHand,
            rHandSide: randomRHand,
            solution: solution
        )
    }
    
    override func operatorDisplay() -> String {
        return "*"
    }
    
    override func mathType() -> MathType {
        return .multiplication
    }
    
}
