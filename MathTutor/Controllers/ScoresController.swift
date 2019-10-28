//
//  ScoresController.swift
//  MathTutor
//
//  Created by John on 10/15/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import UIKit

class ScoresController: UIViewController {
    
    @IBOutlet weak var additionOneMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var additionOneMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var additionOneMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var additionThreeMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var additionThreeMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var additionThreeMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var additionFiveMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var additionFiveMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var additionFiveMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var subtractionOneMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var subtractionOneMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var subtractionOneMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var subtractionThreeMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var subtractionThreeMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var subtractionThreeMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var subtractionFiveMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var subtractionFiveMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var subtractionFiveMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var multiplicationOneMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var multiplicationOneMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var multiplicationOneMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var multiplicationThreeMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var multiplicationThreeMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var multiplicationThreeMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var multiplicationFiveMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var multiplicationFiveMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var multiplicationFiveMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var divisionOneMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var divisionOneMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var divisionOneMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var divisionThreeMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var divisionThreeMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var divisionThreeMinuteScoreThreeLabel: UILabel!
    
    @IBOutlet weak var divisionFiveMinuteScoreOneLabel: UILabel!
    @IBOutlet weak var divisionFiveMinuteScoreTwoLabel: UILabel!
    @IBOutlet weak var divisionFiveMinuteScoreThreeLabel: UILabel!
    
    
    let scoreboard = Scoreboard.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayScoring()
    }
    
    @IBAction func closeScores(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func displayScoring() {
        displayAdditionScoring()
        displaySubtractionScoring()
        displayMultiplicationScoring()
        displayDivisionScoring()
    }
    
    func displayAdditionScoring() {
        let additionScorings = scoreboard.additionScoring
        
        let oneMinuteScores = additionScorings[60.0]
        additionOneMinuteScoreOneLabel.text = oneMinuteScores?.scoreOneDisplay()
        additionOneMinuteScoreTwoLabel.text = oneMinuteScores?.scoreTwoDisplay()
        additionOneMinuteScoreThreeLabel.text = oneMinuteScores?.scoreThreeDisplay()
        
        let threeMinuteScores = additionScorings[120.0]
        additionThreeMinuteScoreOneLabel.text = threeMinuteScores?.scoreOneDisplay()
        additionThreeMinuteScoreTwoLabel.text = threeMinuteScores?.scoreTwoDisplay()
        additionThreeMinuteScoreThreeLabel.text = threeMinuteScores?.scoreThreeDisplay()
        
        let fiveMinuteScores = additionScorings[300.0]
        additionFiveMinuteScoreOneLabel.text = fiveMinuteScores?.scoreOneDisplay()
        additionFiveMinuteScoreTwoLabel.text = fiveMinuteScores?.scoreTwoDisplay()
        additionFiveMinuteScoreThreeLabel.text = fiveMinuteScores?.scoreThreeDisplay()
    }
    
    func displaySubtractionScoring() {
        let subtractionScorings = scoreboard.subtractionScoring
        
        let oneMinuteScores = subtractionScorings[60.0]
        subtractionOneMinuteScoreOneLabel.text = oneMinuteScores?.scoreOneDisplay()
        subtractionOneMinuteScoreTwoLabel.text = oneMinuteScores?.scoreTwoDisplay()
        subtractionOneMinuteScoreThreeLabel.text = oneMinuteScores?.scoreThreeDisplay()
        
        let threeMinuteScores = subtractionScorings[120.0]
        subtractionThreeMinuteScoreOneLabel.text = threeMinuteScores?.scoreOneDisplay()
        subtractionThreeMinuteScoreTwoLabel.text = threeMinuteScores?.scoreTwoDisplay()
        subtractionThreeMinuteScoreThreeLabel.text = threeMinuteScores?.scoreThreeDisplay()
        
        let fiveMinuteScores = subtractionScorings[300.0]
        subtractionFiveMinuteScoreOneLabel.text = fiveMinuteScores?.scoreOneDisplay()
        subtractionFiveMinuteScoreTwoLabel.text = fiveMinuteScores?.scoreTwoDisplay()
        subtractionFiveMinuteScoreThreeLabel.text = fiveMinuteScores?.scoreThreeDisplay()
    }
    
    func displayMultiplicationScoring() {
        let multiplicationScorings = scoreboard.multiplicationScoring
        
        let oneMinuteScores = multiplicationScorings[60.0]
        multiplicationOneMinuteScoreOneLabel.text = oneMinuteScores?.scoreOneDisplay()
        multiplicationOneMinuteScoreTwoLabel.text = oneMinuteScores?.scoreTwoDisplay()
        multiplicationOneMinuteScoreThreeLabel.text = oneMinuteScores?.scoreThreeDisplay()
        
        let threeMinuteScores = multiplicationScorings[120.0]
        multiplicationThreeMinuteScoreOneLabel.text = threeMinuteScores?.scoreOneDisplay()
        multiplicationThreeMinuteScoreTwoLabel.text = threeMinuteScores?.scoreTwoDisplay()
        multiplicationThreeMinuteScoreThreeLabel.text = threeMinuteScores?.scoreThreeDisplay()
        
        let fiveMinuteScores = multiplicationScorings[300.0]
        multiplicationFiveMinuteScoreOneLabel.text = fiveMinuteScores?.scoreOneDisplay()
        multiplicationFiveMinuteScoreTwoLabel.text = fiveMinuteScores?.scoreTwoDisplay()
        multiplicationFiveMinuteScoreThreeLabel.text = fiveMinuteScores?.scoreThreeDisplay()
    }
    
    func displayDivisionScoring() {
        let divisionScorings = scoreboard.divisionScoring
        
        let oneMinuteScores = divisionScorings[60.0]
        divisionOneMinuteScoreOneLabel.text = oneMinuteScores?.scoreOneDisplay()
        divisionOneMinuteScoreTwoLabel.text = oneMinuteScores?.scoreTwoDisplay()
        divisionOneMinuteScoreThreeLabel.text = oneMinuteScores?.scoreThreeDisplay()
        
        let threeMinuteScores = divisionScorings[120.0]
        divisionThreeMinuteScoreOneLabel.text = threeMinuteScores?.scoreOneDisplay()
        divisionThreeMinuteScoreTwoLabel.text = threeMinuteScores?.scoreTwoDisplay()
        divisionThreeMinuteScoreThreeLabel.text = threeMinuteScores?.scoreThreeDisplay()
        
        let fiveMinuteScores = divisionScorings[300.0]
        divisionFiveMinuteScoreOneLabel.text = fiveMinuteScores?.scoreOneDisplay()
        divisionFiveMinuteScoreTwoLabel.text = fiveMinuteScores?.scoreTwoDisplay()
        divisionFiveMinuteScoreThreeLabel.text = fiveMinuteScores?.scoreThreeDisplay()
    }
    
}
