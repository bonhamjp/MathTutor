//
//  MathEquationTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class MathEquationTests: XCTestCase {
    
    var mathEquation: MathEquation!
    
    override func setUp() {
        super.setUp()
        
        mathEquation = MathEquation(lHandSide: 3.0, rHandSide: 4.0, solution: 7.0)
    }
    
    override func tearDown() {
        mathEquation = nil
        
        super.tearDown()
    }
    
    func testEquationGeneratesThreeIncorrectGuesses() {
        if mathEquation.hiddenSegment == .lHand {
            XCTAssertNotEqual(mathEquation.incorrectGuess1, 3.0, "Incorrect guess generation invalid")
            XCTAssertNotEqual(mathEquation.incorrectGuess2, 3.0, "Incorrect guess generation invalid")
            XCTAssertNotEqual(mathEquation.incorrectGuess3, 3.0, "Incorrect guess generation invalid")
        } else if mathEquation.hiddenSegment == .rHand {
            XCTAssertNotEqual(mathEquation.incorrectGuess1, 4.0, "Incorrect guess generation invalid")
            XCTAssertNotEqual(mathEquation.incorrectGuess2, 4.0, "Incorrect guess generation invalid")
            XCTAssertNotEqual(mathEquation.incorrectGuess3, 4.0, "Incorrect guess generation invalid")
        } else {
            XCTAssertNotEqual(mathEquation.incorrectGuess1, 7.0, "Incorrect guess generation invalid")
            XCTAssertNotEqual(mathEquation.incorrectGuess2, 7.0, "Incorrect guess generation invalid")
            XCTAssertNotEqual(mathEquation.incorrectGuess3, 7.0, "Incorrect guess generation invalid")
        }
    }
    
    func testCheckGuessReturnsFalseIfNotEqualToSolution() {
        XCTAssertNotEqual(mathEquation.incorrectGuess1, 1.0, "Correct solution guess check failed")
    }
    
    func testGetTargetReturnsARandomlyChosenPartOfEquation() {
        if mathEquation.hiddenSegment == .lHand {
            XCTAssertEqual(mathEquation.getTarget(), 3.0, "Target value incorrect")
        } else if mathEquation.hiddenSegment == .rHand {
            XCTAssertEqual(mathEquation.getTarget(), 4.0, "Target value incorrect")
        } else {
            XCTAssertEqual(mathEquation.getTarget(), 7.0, "Target value incorrect")
        }
    }

    func testLHandDisplayReturnsFormattedLeftHandIfNotHiddenOrQuestionmark() {
        if mathEquation.hiddenSegment == .lHand {
            XCTAssertEqual(mathEquation.lHandDisplay(), "?", "Left hand display incorrect")
        } else {
            XCTAssertEqual(mathEquation.lHandDisplay(), "3", "Left hand display incorrect")
        }
    }
    
    func testRHandDisplayReturnsFormattedRightHandIfNotHiddenOrQuestionmark() {
        if mathEquation.hiddenSegment == .rHand {
            XCTAssertEqual(mathEquation.rHandDisplay(), "?", "Right hand display incorrect")
        } else {
            XCTAssertEqual(mathEquation.rHandDisplay(), "4", "Right hand display incorrect")
        }
    }
    
    func testSolutionDisplayReturnsFormattedSolutionIfNotHiddenOrQuestionmark() {
        if mathEquation.hiddenSegment == .solution {
            XCTAssertEqual(mathEquation.solutionDisplay(), "?", "Solution display incorrect")
        } else {
            XCTAssertEqual(mathEquation.solutionDisplay(), "7", "Solution display incorrect")
        }
    }
    
}
