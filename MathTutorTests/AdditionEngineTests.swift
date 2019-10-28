//
//  AdditionEngineTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class AdditionEngineTests: XCTestCase {
    
    var additionEngine: AdditionEngine!
    
    override func setUp() {
        super.setUp()
        
        additionEngine = AdditionEngine()
    }
    
    override func tearDown() {
        additionEngine = nil
        
        super.tearDown()
    }
    
    func testGeneratesEquationWithLeftHandInSpecifiedRange() {
        let testEquation = additionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.lHandSide, 0, "AdditionEngine left hand side less than bottom of range")
        XCTAssertLessThan(testEquation.lHandSide, MAX_ADDEND, "AdditionEngine left hand side greater than top of range")
    }
    
    func testGeneratesEquationWithRightHandInSpecifiedRange() {
        let testEquation = additionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.rHandSide, 0, "AdditionEngine right hand side less than bottom of range")
        XCTAssertLessThan(testEquation.rHandSide, MAX_ADDEND, "AdditionEngine right hand side greater than top of range")
    }
    
    func testGeneratesEquationSolutionInSpecifiedRange() {
        let testEquation = additionEngine.generateEquation()
        
        XCTAssertGreaterThan(testEquation.solution, 1, "AdditionEngine solution less than bottom of range")
        XCTAssertLessThan(testEquation.solution, MAX_ADDEND * 2, "AdditionEngine solution greater than top of range")
    }
    
    func testMathOperatorIsAccurate() {
        XCTAssertEqual(additionEngine.operatorDisplay(), "+", "AdditionEngine is returning incorrect operator display")
    }
    
    func testMathTypeIsAccurate() {
        XCTAssertEqual(additionEngine.mathType(), .addition, "AdditionEngine is returning incorrect type")
    }
    
}
