//
//  SettingsController.swift
//  MathTutor
//
//  Created by John on 10/15/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import UIKit

let QUIZ_SECOND_TITLES = ["1 Minute", "3 Minutes", "5 Minutes"]
let QUIZ_SECOND_OPTIONS: [String: Float] = ["1 Minute": 60.0, "3 Minutes": 120.0, "5 Minutes": 300.0]

class SettingsController: UIViewController {
    
    @IBOutlet weak var quizSecondsSegment: UISegmentedControl!
    
    var settings = Settings.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuizSecondsSegment()
    }
    
    @IBAction func closeSettings(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupQuizSecondsSegment() {
        quizSecondsSegment.insertSegment(with: nil, at: 2, animated: false)
        
        var i = 0
        for quizSecondsTitle in QUIZ_SECOND_TITLES {
            quizSecondsSegment.setTitle(quizSecondsTitle, forSegmentAt: i)
        
            if settings.quizSeconds == QUIZ_SECOND_OPTIONS[quizSecondsTitle] {
                quizSecondsSegment.selectedSegmentIndex = i
            }
            
            i += 1
        }
    }
    
    @IBAction func updateQuizDuration(_ sender: UISegmentedControl) {
        let selectedQuizSecondTitle = quizSecondsSegment.titleForSegment(at: quizSecondsSegment.selectedSegmentIndex)!
        
        settings.quizSeconds = QUIZ_SECOND_OPTIONS[selectedQuizSecondTitle]!
        settings.store()
    }
    
    
}
