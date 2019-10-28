//
//  CountdownTests.swift
//  MathTutorTests
//
//  Created by John on 10/27/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import XCTest

@testable import MathTutor

class CountdownTests: XCTestCase {
    
    var countdown: Countdown!
    
    override func setUp() {
        super.setUp()
        
        countdown = Countdown(targetTime: 60.0)
    }
    
    override func tearDown() {
        countdown = nil
        
        super.tearDown()
    }
    
    func testStartTimeIsSetTo0() {
        XCTAssertEqual(countdown.startTime, 0.0, "Start time initialized to incorrect value")
    }
    
    func testElapsedTimeIsSetTo0() {
        XCTAssertEqual(countdown.elapsedTime, 0.0, "Elapsed time initialized to incorrect value")
    }
    
    func testUpdateIncreasesElapsedTime() {
        let originalElapsedTime = countdown.elapsedTime
        
        sleep(1)
        
        countdown.update()
        
        XCTAssertGreaterThan(countdown.elapsedTime, originalElapsedTime, "Elapsed time was not incremented correctly")
    }
    
    func testPercentCompleteCalculatesPercentOfTimeCountedDown() {
        countdown.elapsedTime = 15.0
        
        XCTAssertEqual(countdown.percentComplete(), 0.25, "Percent completed calculated incorrectly")
        
        countdown.elapsedTime = 30.0
        
        XCTAssertEqual(countdown.percentComplete(), 0.5, "Percent completed calculated incorrectly")
        
        countdown.elapsedTime = 45.0
        
        XCTAssertEqual(countdown.percentComplete(), 0.75, "Percent completed calculated incorrectly")
        
        countdown.elapsedTime = 60.0
        
        XCTAssertEqual(countdown.percentComplete(), 1.0, "Percent completed calculated incorrectly")
    }
    
    func testTimeExpiredFalseIfElapsedLessThanTarget() {
        countdown.elapsedTime = 59.0
        
        XCTAssert(!countdown.timeExpired(), "Time expired is incorrect")
    }
    
    func testTimeExpiredTrueIfElapsedAtLeastTarget() {
        countdown.elapsedTime = 60.0
        
        XCTAssert(countdown.timeExpired(), "Time expired is incorrect")
    }
    
}
