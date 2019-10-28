//
//  ViewController.swift
//  MathTutor
//
//  Created by John on 10/14/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import UIKit

class MainMenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AdditionQuizSegue" {
            let quizController: QuizController = segue.destination as! QuizController
            
            quizController.mathEngine = AdditionEngine()
            quizController.currentEquation = quizController.mathEngine.generateEquation()
        } else if segue.identifier == "SubtractionQuizSegue" {
            let quizController: QuizController = segue.destination as! QuizController
            
            quizController.mathEngine = SubtractionEngine()
            quizController.currentEquation = quizController.mathEngine.generateEquation()
        } else if segue.identifier == "MultiplicationQuizSegue" {
            let quizController: QuizController = segue.destination as! QuizController
            
            quizController.mathEngine = MultiplicationEngine()
            quizController.currentEquation = quizController.mathEngine.generateEquation()
        } else if segue.identifier == "DivisionQuizSegue" {
            let quizController: QuizController = segue.destination as! QuizController
            
            quizController.mathEngine = DivisionEngine()
            quizController.currentEquation = quizController.mathEngine.generateEquation()
        }
    }
    
}
