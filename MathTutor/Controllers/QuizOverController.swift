//
//  QuizOverController.swift
//  MathTutor
//
//  Created by John on 10/19/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import UIKit

class QuizOverController: UIViewController {
    
    @IBOutlet weak var QuizScoreLabel: UILabel!
    
    var score: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuizScoreLabel.text = score!
    }
    
    @IBAction func restartQuiz(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goHome(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
