//
//  SubtractionEngineTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class SubtractionEngineTests: XCTestCase {
    
    var subtractionEngine: SubtractionEngine!
    
    override func setUp() {
        super.setUp()
        
        subtractionEngine = SubtractionEngine()
    }
    
    override func tearDown() {
        subtractionEngine = nil
        
        super.tearDown()
    }
    
    func testGeneratesEquationWithLeftHandInSpecifiedRange() {
        let testEquation = subtractionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.lHandSide, 1, "SubtractionEngine left hand side less than bottom of range")
        XCTAssertLessThan(testEquation.lHandSide, MAX_MINUEND, "SubtractionEngine left hand side greater than top of range")
    }
    
    func testGeneratesEquationWithRightHandInSpecifiedRange() {
        let testEquation = subtractionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.rHandSide, 1, "SubtractionEngine right hand side less than bottom of range")
        XCTAssertLessThan(testEquation.rHandSide, MAX_MINUEND, "SubtractionEngine right hand side greater than top of range")
    }
    
    func testGeneratesEquationSolutionInSpecifiedRange() {
        let testEquation = subtractionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.solution, -MAX_MINUEND * 2, "SubtractionEngine solution less than bottom of range")
        XCTAssertLessThan(testEquation.solution, MAX_MINUEND * 2, "SubtractionEngine solution greater than top of range")
    }
    
    func testMathOperatorIsAccurate() {
        XCTAssertEqual(subtractionEngine.operatorDisplay(), "-", "SubtractionEngine is returning incorrect operator display")
    }
    
    func testMathTypeIsAccurate() {
        XCTAssertEqual(subtractionEngine.mathType(), .subtraction, "SubtractionEngine is returning incorrect type")
    }
    
}
