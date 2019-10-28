//
//  DivisionEngineTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class DivisionEngineTests: XCTestCase {
    
    var divisionEngine: DivisionEngine!
    
    override func setUp() {
        super.setUp()
        
        divisionEngine = DivisionEngine()
    }
    
    override func tearDown() {
        divisionEngine = nil
        
        super.tearDown()
    }
    
    func testGeneratesEquationWithLeftHandInSpecifiedRange() {
        let testEquation = divisionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.lHandSide, 2 * 2, "DivisionEngine left hand side less than bottom of range")
        XCTAssertLessThan(testEquation.lHandSide, MAX_DIVISOR * MAX_SOLUTION, "DivisionEngine left hand side greater than top of range")
    }
    
    func testGeneratesEquationWithRightHandInSpecifiedRange() {
        let testEquation = divisionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.rHandSide, 1, "DivisionEngine right hand side less than bottom of range")
        XCTAssertLessThan(testEquation.rHandSide, MAX_DIVISOR, "DivisionEngine right hand side greater than top of range")
    }
    
    func testGeneratesEquationSolutionInSpecifiedRange() {
        let testEquation = divisionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.solution, 1, "DivisionEngine solution less than bottom of range")
        XCTAssertLessThan(testEquation.solution, MAX_SOLUTION, "DivisionEngine solution greater than top of range")
    }
    
    func testMathOperatorIsAccurate() {
        XCTAssertEqual(divisionEngine.operatorDisplay(), "/", "DivisionEngine is returning incorrect operator display")
    }
    
    func testMathTypeIsAccurate() {
        XCTAssertEqual(divisionEngine.mathType(), .division, "DivisionEngine is returning incorrect type")
    }
}
