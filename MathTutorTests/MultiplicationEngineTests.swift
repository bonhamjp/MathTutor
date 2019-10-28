//
//  MultiplicationEngineTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class MultiplicationEngineTests: XCTestCase {
    
    var multiplicationEngine: MultiplicationEngine!
    
    override func setUp() {
        super.setUp()
        
        multiplicationEngine = MultiplicationEngine()
    }
    
    override func tearDown() {
        multiplicationEngine = nil
        
        super.tearDown()
    }
    
    func testGeneratesEquationWithLeftHandInSpecifiedRange() {
        let testEquation = multiplicationEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.lHandSide, 1, "MultiplicationEngine left hand side less than bottom of range")
        XCTAssertLessThan(testEquation.lHandSide, MAX_FACTOR, "MultiplicationEngine left hand side greater than top of range")
    }
    
    func testGeneratesEquationWithRightHandInSpecifiedRange() {
        let testEquation = multiplicationEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.rHandSide, 1, "MultiplicationEngine right hand side less than bottom of range")
        XCTAssertLessThan(testEquation.rHandSide, MAX_FACTOR, "MultiplicationEngine right hand side greater than top of range")
    }
    
    func testGeneratesEquationSolutionInSpecifiedRange() {
        let testEquation = multiplicationEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.solution, 2 * 2, "MultiplicationEngine solution less than bottom of range")
        XCTAssertLessThan(testEquation.solution, MAX_FACTOR * MAX_FACTOR, "MultiplicationEngine solution greater than top of range")
    }
    
    func testMathOperatorIsAccurate() {
        XCTAssertEqual(multiplicationEngine.operatorDisplay(), "*", "MultiplicationEngine is returning incorrect operator display")
    }
    
    func testMathTypeIsAccurate() {
        XCTAssertEqual(multiplicationEngine.mathType(), .multiplication, "MultiplicationEngine is returning incorrect type")
    }
    
}
