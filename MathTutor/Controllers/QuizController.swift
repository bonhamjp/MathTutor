//
//  QuizController.swift
//  MathTutor
//
//  Created by John on 10/15/19.
//  Copyright © 2019 JohnBonham. All rights reserved.
//

import UIKit

let DEFAULT_BUTTON_COLOR = UIColor.init(red: 46.0 / 255.0, green: 145.0 / 255.0, blue: 160.0 / 255.0, alpha: 1.0)

let FAILURE_BUTTON_COLOR = UIColor.init(red: 217 / 255.0, green: 106.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
let SUCCESS_BUTTON_COLOR = UIColor.init(red: 48.0 / 255.0, green: 99.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0)

let DEFAULT_SKIP_BUTTON_COLOR = UIColor.init(red: 237.0 / 255.0, green: 174.0 / 255.0, blue: 73.0 / 255.0, alpha: 1.0)
let DISABLED_SKIP_BUTTON_COLOR = UIColor.init(red: 246.0 / 255.0, green: 218.0 / 255.0, blue: 172.0 / 255.0, alpha: 1.0)

let FRAME_TIME = 1.0 / 30.0

let FLASH_TIME = 1.0 / 3.0

let BASE_SKIP_COUNT = 3

let POINTS_ON_CORRECT: Double = 100.0
let POINTS_ON_INCORRECT: Double = 50.0

class QuizController: UIViewController {
    @IBOutlet weak var quizFlashLabel: UILabel!
    
    @IBOutlet weak var QuizControllerStatusBar: LoadingBar!
    
    @IBOutlet weak var QuizLeftHandLabel: UILabel!
    @IBOutlet weak var QuizOperatorLabel: UILabel!
    @IBOutlet weak var QuizRightHandLabel: UILabel!
    @IBOutlet weak var QuizSolutionLabel: UILabel!
    
    @IBOutlet weak var QuizScoreLabel: UILabel!
    
    @IBOutlet weak var QuizGuessOneButton: UIButton!
    @IBOutlet weak var QuizGuessTwoButton: UIButton!
    @IBOutlet weak var QuizGuessThreeButton: UIButton!
    @IBOutlet weak var QuizGuessFourButton: UIButton!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var skipCountLabel: UILabel!
    
    let quizSeconds = Double(Settings.init().quizSeconds)
    
    var score = 0.0
    
    var skipsLeft = BASE_SKIP_COUNT
    
    var countdown: Countdown = Countdown(targetTime: Double(Settings.init().quizSeconds))
    
    var mathEngine: MathEngine! = nil
    var currentEquation: MathEquation! = nil
    
    var quizTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupGame()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        quizTimer?.invalidate()
        quizTimer = nil
    }
    
    func setupGame() {
        countdown.start()
        
        score = 0.0
        
        quizFlashLabel.text = ""
        
        skipsLeft = BASE_SKIP_COUNT
        skipButton.isEnabled = true
        skipButton.backgroundColor = DEFAULT_SKIP_BUTTON_COLOR

        startGameTimer()
        
        displayQuizState()
    }
    
    func startGameTimer() {
        quizTimer = Timer.scheduledTimer(
            timeInterval: FRAME_TIME,
            target: self,
            selector: #selector(QuizController.updateGame),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateGame() {
        countdown.update()
        
        if countdown.timeExpired() {
            endQuiz()
        } else {
            QuizControllerStatusBar.setPercentComplete(percentage: CGFloat(countdown.percentComplete()))
            QuizControllerStatusBar.setNeedsDisplay()
        }
    }
    
    func displayQuizState() {
        displayQuestion()
        displayScore()
        displayGuessesLeft()
    }
    
    func displayQuestion() {
        QuizLeftHandLabel.text = currentEquation.lHandDisplay()
        QuizOperatorLabel.text = mathEngine.operatorDisplay()
        QuizRightHandLabel.text = currentEquation.rHandDisplay()
        QuizSolutionLabel.text = currentEquation.solutionDisplay()
        
        let guesses = currentEquation.guesses()
        
        QuizGuessOneButton.setTitle(String(Int(guesses[0])), for: .normal)
        QuizGuessTwoButton.setTitle(String(Int(guesses[1])), for: .normal)
        QuizGuessThreeButton.setTitle(String(Int(guesses[2])), for: .normal)
        QuizGuessFourButton.setTitle(String(Int(guesses[3])), for: .normal)
    }
    
    func displayScore() {
        QuizScoreLabel.text = String(Int(score))
    }
    
    func displayGuessesLeft() {
        skipCountLabel.text = String(skipsLeft)
    }
    
    @IBAction func quitQuizButton(_ sender: UIButton) {
        quizTimer?.invalidate()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func QuizGuess(_ sender: UIButton) {
        submitGuess(guess: Float(sender.currentTitle!)!, buttonIdentifier: sender.accessibilityIdentifier!)
    }
    
    @IBAction func skipQuizQuestionButton(_ sender: UIButton) {
        skipsLeft -= 1
        
        currentEquation = mathEngine.generateEquation()
        
        if skipsLeft <= 0 {
            skipButton.isEnabled = false
            skipButton.backgroundColor = DISABLED_SKIP_BUTTON_COLOR
        }
        
        displayQuizState()
    }
    
    func submitGuess(guess: Float, buttonIdentifier: String) {
        if currentEquation.checkGuess(guess: guess) {
            score += POINTS_ON_CORRECT
            
            quizFlashLabel.text = "+ \(String(Int(POINTS_ON_CORRECT)))"
            quizFlashLabel.textColor = SUCCESS_BUTTON_COLOR
            
            if buttonIdentifier == "QuizGuessOneButton" {
                QuizGuessOneButton.backgroundColor = SUCCESS_BUTTON_COLOR
            } else if buttonIdentifier == "QuizGuessTwoButton" {
                QuizGuessTwoButton.backgroundColor = SUCCESS_BUTTON_COLOR
            } else if buttonIdentifier == "QuizGuessThreeButton" {
                QuizGuessThreeButton.backgroundColor = SUCCESS_BUTTON_COLOR
            } else if buttonIdentifier == "QuizGuessFourButton" {
                QuizGuessFourButton.backgroundColor = SUCCESS_BUTTON_COLOR
            }
        } else {
            score -= POINTS_ON_INCORRECT
            
            quizFlashLabel.text = "- \(String(Int(POINTS_ON_INCORRECT)))"
            quizFlashLabel.textColor = FAILURE_BUTTON_COLOR
            
            if buttonIdentifier == "QuizGuessOneButton" {
                QuizGuessOneButton.backgroundColor = FAILURE_BUTTON_COLOR
            } else if buttonIdentifier == "QuizGuessTwoButton" {
                QuizGuessTwoButton.backgroundColor = FAILURE_BUTTON_COLOR
            } else if buttonIdentifier == "QuizGuessThreeButton" {
                QuizGuessThreeButton.backgroundColor = FAILURE_BUTTON_COLOR
            } else if buttonIdentifier == "QuizGuessFourButton" {
                QuizGuessFourButton.backgroundColor = FAILURE_BUTTON_COLOR
            }
        }
        
        disableAnswerButtons()
        
        Timer.scheduledTimer(
            timeInterval: FLASH_TIME,
            target: self,
            selector: #selector(QuizController.setupNextQuestion),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func setupNextQuestion() {
        quizFlashLabel.text = ""
        
        QuizGuessOneButton.backgroundColor = DEFAULT_BUTTON_COLOR
        QuizGuessTwoButton.backgroundColor = DEFAULT_BUTTON_COLOR
        QuizGuessThreeButton.backgroundColor = DEFAULT_BUTTON_COLOR
        QuizGuessFourButton.backgroundColor = DEFAULT_BUTTON_COLOR
        
        enableAnswerButtons()
        
        currentEquation = mathEngine.generateEquation()
        
        displayQuizState()
    }
    
    func disableAnswerButtons() {
        QuizGuessOneButton.isEnabled = false
        QuizGuessTwoButton.isEnabled = false
        QuizGuessThreeButton.isEnabled = false
        QuizGuessFourButton.isEnabled = false
    }
    
    func enableAnswerButtons() {
        QuizGuessOneButton.isEnabled = true
        QuizGuessTwoButton.isEnabled = true
        QuizGuessThreeButton.isEnabled = true
        QuizGuessFourButton.isEnabled = true
    }
    
    func endQuiz() {
        let scoreboard = Scoreboard.init()
        scoreboard.addScore(mathType: mathEngine.mathType(), quizSeconds: Float(quizSeconds), score: Float(score))
        scoreboard.store()
        
        let quizOverController = self.storyboard?.instantiateViewController(withIdentifier: "QuizOverController") as! QuizOverController
        quizOverController.score = String(Int(score))
        
        self.present(quizOverController, animated: false, completion: nil)
    }
    
}
