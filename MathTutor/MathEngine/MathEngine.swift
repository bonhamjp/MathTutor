//
//  MathEngine.swift
//  MathTutor
//
//  Created by John on 10/16/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

class MathEngine {

    init() {}
    
    func generateEquation() -> MathEquation {
        return MathEquation(lHandSide: 0.0, rHandSide: 0.0, solution: 0.0)
    }
    
    func operatorDisplay() -> String {
        return ""
    }
    
    func mathType() -> MathType {
        return .invalid
    }
    
}
