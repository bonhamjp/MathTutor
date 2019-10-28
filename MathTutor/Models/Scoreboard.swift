//
//  Scoreboard.swift
//  MathTutor
//
//  Created by John on 10/22/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

class Scoring {
    
    var scoreOne: Float
    var scoreTwo: Float
    var scoreThree: Float
    
    init(scoreOne: Float, scoreTwo: Float, scoreThree: Float) {
        self.scoreOne = scoreOne
        self.scoreTwo = scoreTwo
        self.scoreThree = scoreThree
    }
    
    func addScore(newScore: Float) {
        if newScore > scoreOne {
            let tmpScoreOne = scoreOne
            let tmpScoreTwo = scoreTwo
            
            scoreOne = newScore
            scoreTwo = tmpScoreOne
            scoreThree = tmpScoreTwo
        } else if newScore > scoreTwo {
            let tmpScore = scoreTwo
            
            scoreTwo = newScore
            scoreThree = tmpScore
        } else if newScore > scoreThree {
            scoreThree = newScore
        }
    }
    
    func scoreOneDisplay() -> String {
        if scoreOne > 0.0 {
            return String(Int(scoreOne))
        } else {
            return "-"
        }
    }
    
    func scoreTwoDisplay() -> String {
        if scoreTwo > 0.0 {
            return String(Int(scoreTwo))
        } else {
            return "-"
        }
    }
    
    func scoreThreeDisplay() -> String {
        if scoreThree > 0.0 {
            return String(Int(scoreThree))
        } else {
            return "-"
        }
    }
    
}

class Scoreboard {
    
    var additionScoring: [Float: Scoring]
    var subtractionScoring: [Float: Scoring]
    var multiplicationScoring: [Float: Scoring]
    var divisionScoring: [Float: Scoring]
    
    init() {
        let defaults = UserDefaults.standard
        
        // Addition
        var oneMinuteScoreOne = defaults.float(forKey: "additionOneMinuteScoreOne")
        var oneMinuteScoreTwo = defaults.float(forKey: "additionOneMinuteScoreTwo")
        var oneMinuteScoreThree = defaults.float(forKey: "additionOneMinuteScoreThree")
        var oneMinuteScoring = Scoring.init(
            scoreOne: oneMinuteScoreOne,
            scoreTwo: oneMinuteScoreTwo,
            scoreThree: oneMinuteScoreThree
        )
        
        var threeMinuteScoreOne = defaults.float(forKey: "additionThreeMinuteScoreOne")
        var threeMinuteScoreTwo = defaults.float(forKey: "additionThreeMinuteScoreTwo")
        var threeMinuteScoreThree = defaults.float(forKey: "additionThreeMinuteScoreThree")
        var threeMinuteScoring = Scoring.init(
            scoreOne: threeMinuteScoreOne,
            scoreTwo: threeMinuteScoreTwo,
            scoreThree: threeMinuteScoreThree
        )
        
        var fiveMinuteScoreOne = defaults.float(forKey: "additionFiveMinuteScoreOne")
        var fiveMinuteScoreTwo = defaults.float(forKey: "additionFiveMinuteScoreTwo")
        var fiveMinuteScoreThree = defaults.float(forKey: "additionFiveMinuteScoreThree")
        var fiveMinuteScoring = Scoring.init(
            scoreOne: fiveMinuteScoreOne,
            scoreTwo: fiveMinuteScoreTwo,
            scoreThree: fiveMinuteScoreThree
        )
        
        self.additionScoring = [60: oneMinuteScoring, 120: threeMinuteScoring, 300: fiveMinuteScoring]
        
        // Subtraction
        oneMinuteScoreOne = defaults.float(forKey: "subtractionOneMinuteScoreOne")
        oneMinuteScoreTwo = defaults.float(forKey: "subtractionOneMinuteScoreTwo")
        oneMinuteScoreThree = defaults.float(forKey: "subtractionOneMinuteScoreThree")
        oneMinuteScoring = Scoring.init(
            scoreOne: oneMinuteScoreOne,
            scoreTwo: oneMinuteScoreTwo,
            scoreThree: oneMinuteScoreThree
        )
        
        threeMinuteScoreOne = defaults.float(forKey: "subtractionThreeMinuteScoreOne")
        threeMinuteScoreTwo = defaults.float(forKey: "subtractionThreeMinuteScoreTwo")
        threeMinuteScoreThree = defaults.float(forKey: "subtractionThreeMinuteScoreThree")
        threeMinuteScoring = Scoring.init(
            scoreOne: threeMinuteScoreOne,
            scoreTwo: threeMinuteScoreTwo,
            scoreThree: threeMinuteScoreThree
        )
        
        fiveMinuteScoreOne = defaults.float(forKey: "subtractionFiveMinuteScoreOne")
        fiveMinuteScoreTwo = defaults.float(forKey: "subtractionFiveMinuteScoreTwo")
        fiveMinuteScoreThree = defaults.float(forKey: "subtractionFiveMinuteScoreThree")
        fiveMinuteScoring = Scoring.init(
            scoreOne: fiveMinuteScoreOne,
            scoreTwo: fiveMinuteScoreTwo,
            scoreThree: fiveMinuteScoreThree
        )
        
        self.subtractionScoring = [60: oneMinuteScoring, 120: threeMinuteScoring, 300: fiveMinuteScoring]
        
        // Multiplication
        oneMinuteScoreOne = defaults.float(forKey: "multiplicationOneMinuteScoreOne")
        oneMinuteScoreTwo = defaults.float(forKey: "multiplicationOneMinuteScoreTwo")
        oneMinuteScoreThree = defaults.float(forKey: "multiplicationOneMinuteScoreThree")
        oneMinuteScoring = Scoring.init(
            scoreOne: oneMinuteScoreOne,
            scoreTwo: oneMinuteScoreTwo,
            scoreThree: oneMinuteScoreThree
        )
        
        threeMinuteScoreOne = defaults.float(forKey: "multiplicationThreeMinuteScoreOne")
        threeMinuteScoreTwo = defaults.float(forKey: "multiplicationThreeMinuteScoreTwo")
        threeMinuteScoreThree = defaults.float(forKey: "multiplicationThreeMinuteScoreThree")
        threeMinuteScoring = Scoring.init(
            scoreOne: threeMinuteScoreOne,
            scoreTwo: threeMinuteScoreTwo,
            scoreThree: threeMinuteScoreThree
        )
        
        fiveMinuteScoreOne = defaults.float(forKey: "multiplicationFiveMinuteScoreOne")
        fiveMinuteScoreTwo = defaults.float(forKey: "multiplicationFiveMinuteScoreTwo")
        fiveMinuteScoreThree = defaults.float(forKey: "multiplicationFiveMinuteScoreThree")
        fiveMinuteScoring = Scoring.init(
            scoreOne: fiveMinuteScoreOne,
            scoreTwo: fiveMinuteScoreTwo,
            scoreThree: fiveMinuteScoreThree
        )
        
        self.multiplicationScoring = [60: oneMinuteScoring, 120: threeMinuteScoring, 300: fiveMinuteScoring]
        
        // Division
        oneMinuteScoreOne = defaults.float(forKey: "divisionOneMinuteScoreOne")
        oneMinuteScoreTwo = defaults.float(forKey: "divisionOneMinuteScoreTwo")
        oneMinuteScoreThree = defaults.float(forKey: "divisionOneMinuteScoreThree")
        oneMinuteScoring = Scoring.init(
            scoreOne: oneMinuteScoreOne,
            scoreTwo: oneMinuteScoreTwo,
            scoreThree: oneMinuteScoreThree
        )
        
        threeMinuteScoreOne = defaults.float(forKey: "divisionThreeMinuteScoreOne")
        threeMinuteScoreTwo = defaults.float(forKey: "divisionThreeMinuteScoreTwo")
        threeMinuteScoreThree = defaults.float(forKey: "divisionThreeMinuteScoreThree")
        threeMinuteScoring = Scoring.init(
            scoreOne: threeMinuteScoreOne,
            scoreTwo: threeMinuteScoreTwo,
            scoreThree: threeMinuteScoreThree
        )
        
        fiveMinuteScoreOne = defaults.float(forKey: "divisionFiveMinuteScoreOne")
        fiveMinuteScoreTwo = defaults.float(forKey: "divisionFiveMinuteScoreTwo")
        fiveMinuteScoreThree = defaults.float(forKey: "divisionFiveMinuteScoreThree")
        fiveMinuteScoring = Scoring.init(
            scoreOne: fiveMinuteScoreOne,
            scoreTwo: fiveMinuteScoreTwo,
            scoreThree: fiveMinuteScoreThree
        )
        
        self.divisionScoring = [60: oneMinuteScoring, 120: threeMinuteScoring, 300: fiveMinuteScoring]
    }
    
    func addScore(mathType: MathType, quizSeconds: Float, score: Float) {
        switch mathType {
        case .addition:
            let scorings = additionScoring[quizSeconds]!
            scorings.addScore(newScore: score)
            
        case .subtraction:
            let scorings = subtractionScoring[quizSeconds]!
            scorings.addScore(newScore: score)
            
        case .multiplication:
            let scorings = multiplicationScoring[quizSeconds]!
            scorings.addScore(newScore: score)
        
        // division
        default:
            let scorings = divisionScoring[quizSeconds]!
            scorings.addScore(newScore: score)
            
        }
    }
    
    func store() {
        let defaults = UserDefaults.standard
        
        // Addition
        var oneMinuteScoring = additionScoring[60.0]!
        defaults.set(oneMinuteScoring.scoreOne, forKey: "additionOneMinuteScoreOne")
        defaults.set(oneMinuteScoring.scoreTwo, forKey: "additionOneMinuteScoreTwo")
        defaults.set(oneMinuteScoring.scoreThree, forKey: "additionOneMinuteScoreThree")

        var threeMinuteScoring = additionScoring[120.0]!
        defaults.set(threeMinuteScoring.scoreOne, forKey: "additionThreeMinuteScoreOne")
        defaults.set(threeMinuteScoring.scoreTwo, forKey: "additionThreeMinuteScoreTwo")
        defaults.set(threeMinuteScoring.scoreThree, forKey: "additionThreeMinuteScoreThree")

        var fiveMinuteScoring = additionScoring[300.0]!
        defaults.set(fiveMinuteScoring.scoreOne, forKey: "additionFiveMinuteScoreOne")
        defaults.set(fiveMinuteScoring.scoreTwo, forKey: "additionFiveMinuteScoreTwo")
        defaults.set(fiveMinuteScoring.scoreThree, forKey: "additionFiveMinuteScoreThree")

        // Subtraction
        oneMinuteScoring = subtractionScoring[60.0]!
        defaults.set(oneMinuteScoring.scoreOne, forKey: "subtractionOneMinuteScoreOne")
        defaults.set(oneMinuteScoring.scoreTwo, forKey: "subtractionOneMinuteScoreTwo")
        defaults.set(oneMinuteScoring.scoreThree, forKey: "subtractionOneMinuteScoreThree")

        threeMinuteScoring = subtractionScoring[120.0]!
        defaults.set(threeMinuteScoring.scoreOne, forKey: "subtractionThreeMinuteScoreOne")
        defaults.set(threeMinuteScoring.scoreTwo, forKey: "subtractionThreeMinuteScoreTwo")
        defaults.set(threeMinuteScoring.scoreThree, forKey: "subtractionThreeMinuteScoreThree")

        fiveMinuteScoring = subtractionScoring[300.0]!
        defaults.set(fiveMinuteScoring.scoreOne, forKey: "subtractionFiveMinuteScoreOne")
        defaults.set(fiveMinuteScoring.scoreTwo, forKey: "subtractionFiveMinuteScoreTwo")
        defaults.set(fiveMinuteScoring.scoreThree, forKey: "subtractionFiveMinuteScoreThree")

        // Multiplication
        oneMinuteScoring = multiplicationScoring[60.0]!
        defaults.set(oneMinuteScoring.scoreOne, forKey: "multiplicationOneMinuteScoreOne")
        defaults.set(oneMinuteScoring.scoreTwo, forKey: "multiplicationOneMinuteScoreTwo")
        defaults.set(oneMinuteScoring.scoreThree, forKey: "multiplicationOneMinuteScoreThree")

        threeMinuteScoring = multiplicationScoring[120.0]!
        defaults.set(threeMinuteScoring.scoreOne, forKey: "multiplicationThreeMinuteScoreOne")
        defaults.set(threeMinuteScoring.scoreTwo, forKey: "multiplicationThreeMinuteScoreTwo")
        defaults.set(threeMinuteScoring.scoreThree, forKey: "multiplicationThreeMinuteScoreThree")

        fiveMinuteScoring = multiplicationScoring[300.0]!
        defaults.set(fiveMinuteScoring.scoreOne, forKey: "multiplicationFiveMinuteScoreOne")
        defaults.set(fiveMinuteScoring.scoreTwo, forKey: "multiplicationFiveMinuteScoreTwo")
        defaults.set(fiveMinuteScoring.scoreThree, forKey: "multiplicationFiveMinuteScoreThree")

        // Division
        oneMinuteScoring = divisionScoring[60.0]!
        defaults.set(oneMinuteScoring.scoreOne, forKey: "divisionOneMinuteScoreOne")
        defaults.set(oneMinuteScoring.scoreTwo, forKey: "divisionOneMinuteScoreTwo")
        defaults.set(oneMinuteScoring.scoreThree, forKey: "divisionOneMinuteScoreThree")

        threeMinuteScoring = divisionScoring[120.0]!
        defaults.set(threeMinuteScoring.scoreOne, forKey: "divisionThreeMinuteScoreOne")
        defaults.set(threeMinuteScoring.scoreTwo, forKey: "divisionThreeMinuteScoreTwo")
        defaults.set(threeMinuteScoring.scoreThree, forKey: "divisionThreeMinuteScoreThree")

        fiveMinuteScoring = divisionScoring[300.0]!
        defaults.set(fiveMinuteScoring.scoreOne, forKey: "divisionFiveMinuteScoreOne")
        defaults.set(fiveMinuteScoring.scoreTwo, forKey: "divisionFiveMinuteScoreTwo")
        defaults.set(fiveMinuteScoring.scoreThree, forKey: "divisionFiveMinuteScoreThree")
    }
    
}
