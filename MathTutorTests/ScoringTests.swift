//
//  ScoringTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class ScoringTests: XCTestCase {
    
    var scoring: Scoring!
    
    override func setUp() {
        super.setUp()
        
        scoring = Scoring(scoreOne: 10.0, scoreTwo: 8.0, scoreThree: 5.0)
    }
    
    override func tearDown() {
        scoring = nil
        
        super.tearDown()
    }
    
    func testAddScoreDoesNotChangeScoreValuesIfNewValueLowerThanAllThree() {
        scoring.addScore(newScore: 4.0)
        
        XCTAssertEqual(scoring.scoreOne, 10.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreTwo, 8.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreThree, 5.0, "Invalid score change")
    }
    
    func testAddScoreReplacesFirstScoreWithHigherValueAndShiftsOthersDown() {
        scoring.addScore(newScore: 11.0)
        
        XCTAssertEqual(scoring.scoreOne, 11.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreTwo, 10.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreThree, 8.0, "Invalid score change")
    }
    
    func testAddScoreReplacesSecondScoreWithHigherValueAndShiftsOthersDown() {
        scoring.addScore(newScore: 9.0)
        
        XCTAssertEqual(scoring.scoreOne, 10.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreTwo, 9.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreThree, 8.0, "Invalid score change")
    }
    
    func testAddScoreReplacesThirdScoreWithHigherValue() {
        scoring.addScore(newScore: 7.0)
        
        XCTAssertEqual(scoring.scoreOne, 10.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreTwo, 8.0, "Invalid score change")
        XCTAssertEqual(scoring.scoreThree, 7.0, "Invalid score change")
    }
    
    func testScoreOneDisplayReturnsPlaceholderIfZero() {
        scoring.scoreOne = 0.0
        
        XCTAssertEqual(scoring.scoreOneDisplay(), "-", "ScoreOne display invalid")
    }
    
    func testScoreOneDisplayReturnsScoreAsString() {
        XCTAssertEqual(scoring.scoreOneDisplay(), "10", "ScoreOne display invalid")
    }
    
    func testScoreTwoDisplayReturnsPlaceholderIfZero() {
        scoring.scoreTwo = 0.0
        
        XCTAssertEqual(scoring.scoreTwoDisplay(), "-", "ScoreTwo display invalid")
    }
    
    func testScoreTwoDisplayReturnsScoreAsString() {
        XCTAssertEqual(scoring.scoreTwoDisplay(), "8", "ScoreTwo display invalid")
    }
    
    func testScoreThreeDisplayReturnsPlaceholderIfZero() {
        scoring.scoreThree = 0.0
        
        XCTAssertEqual(scoring.scoreThreeDisplay(), "-", "ScoreThree display invalid")
    }
    
    func testScoreThreeDisplayReturnsScoreAsString() {
        XCTAssertEqual(scoring.scoreThreeDisplay(), "5", "ScoreThree display invalid")
    }
    
}
