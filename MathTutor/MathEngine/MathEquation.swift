//
//  MathEquation.swift
//  MathTutor
//
//  Created by John on 10/16/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import Foundation

enum EquationSegment {
    case lHand
    case rHand
    case solution
}

class MathEquation {
    
    let lHandSide: Float
    let rHandSide: Float
    let solution: Float
    
    let hiddenSegment: EquationSegment
    
    var incorrectGuess1: Float
    var incorrectGuess2: Float
    var incorrectGuess3: Float
    
    init(lHandSide: Float, rHandSide: Float, solution: Float) {
        self.lHandSide = lHandSide
        self.rHandSide = rHandSide
        
        self.solution = solution
        
        hiddenSegment = [
            EquationSegment.lHand,
            EquationSegment.rHand,
            EquationSegment.solution
        ][Int(arc4random_uniform(3))]!
        
        incorrectGuess1 = 0.0
        incorrectGuess2 = 0.0
        incorrectGuess3 = 0.0

        (incorrectGuess1, incorrectGuess2, incorrectGuess3) = generateIncorrectGuesses()
    }
    
    func generateIncorrectGuesses() -> (Float, Float, Float) {
        let target = getTarget()

        var guessOne = target
        var guessTwo = target
        var guessThree = target
        
        let minDeviation = floor(getTarget() * 0.02)
        var maxDeviation = floor(getTarget() * 0.08)
        
        repeat {
            // For calculating random negative numbers
            let tmpSignAdjuster: Float = maxDeviation < 0.0 ? -1.0 : 1.0
            
            let adjustedTarget = target * tmpSignAdjuster
            
            let adjustedMaxDeviation = maxDeviation * tmpSignAdjuster
            let adjustedMinDeviation = minDeviation * tmpSignAdjuster
            
            let guessOneSign: Float = arc4random_uniform(2) == 0 ? 1.0 : -1.0
            let randomOne = Float(arc4random_uniform(UInt32(adjustedMaxDeviation))) + adjustedMinDeviation
            guessOne = ((randomOne * guessOneSign) + adjustedTarget) * tmpSignAdjuster
            
            let guessTwoSign: Float = arc4random_uniform(2) == 0 ? 1.0 : -1.0
            let randomTwo = Float(arc4random_uniform(UInt32(adjustedMaxDeviation))) + adjustedMinDeviation
            guessTwo = ((randomTwo * guessTwoSign) + adjustedTarget) * tmpSignAdjuster
            
            let guessThreeSign: Float = arc4random_uniform(2) == 0 ? 1.0 : -1.0
            let randomThree = Float(arc4random_uniform(UInt32(adjustedMaxDeviation))) + adjustedMinDeviation
            guessThree = ((randomThree * guessThreeSign) + adjustedTarget) * tmpSignAdjuster
            
            maxDeviation += 0.01
        } while guessOne == target ||
                guessOne == guessTwo ||
                guessOne == guessThree ||
                guessTwo == target ||
                guessTwo == guessThree ||
                guessThree == target
        
        return (guessOne, guessTwo, guessThree)
    }
    
    func guesses() -> [Float] {
        var possibleGuesses = [getTarget(), incorrectGuess1, incorrectGuess2, incorrectGuess3]
        
        let guessIndexOne = Int(arc4random_uniform(4))
        
        var guessIndexTwo = Int(arc4random_uniform(4))
        while guessIndexTwo == guessIndexOne {
            guessIndexTwo = Int(arc4random_uniform(4))
        }
        
        var guessIndexThree = Int(arc4random_uniform(4))
        while guessIndexThree == guessIndexOne || guessIndexThree == guessIndexTwo {
            guessIndexThree = Int(arc4random_uniform(4))
        }
      
        var guessIndexFour = Int(arc4random_uniform(4))
        while guessIndexFour == guessIndexOne || guessIndexFour == guessIndexTwo || guessIndexFour == guessIndexThree {
            guessIndexFour = Int(arc4random_uniform(4))
        }
        
        return [
            possibleGuesses[guessIndexOne],
            possibleGuesses[guessIndexTwo],
            possibleGuesses[guessIndexThree],
            possibleGuesses[guessIndexFour],
        ]
    }
    
    func checkGuess(guess: Float) -> Bool {
        return guess == getTarget()
    }
    
    func getTarget() -> Float {
        if hiddenSegment == .lHand {
            return lHandSide
        } else if hiddenSegment == .rHand {
            return rHandSide
        } else {
            return solution
        }
    }
    
    func lHandDisplay() -> String {
        if hiddenSegment == .lHand {
            return "?"
        } else {
            return String(Int(lHandSide))
        }
    }
    
    func rHandDisplay() -> String {
        if hiddenSegment == .rHand {
            return "?"
        } else {
            return String(Int(rHandSide))
        }
    }
    
    func solutionDisplay() -> String {
        if hiddenSegment == .solution {
            return "?"
        } else {
            return String(Int(solution))
        }
    }
}
