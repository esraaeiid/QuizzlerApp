//
//  ViewController.swift
//  Quizzler

//  first question view
// check answer of it
// the rest of questions and check answer of them
//  next quetion function to limit number of quetion
// start over when questions end or cancel
//score bar
// progress bar 
// no.questions track
// showing correct answer label

import UIKit

class ViewController: UIViewController {
    
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestion.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1
        {
            pickedAnswer = true
        }
        else if  sender.tag == 2
        
        {
        pickedAnswer = false
        }
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
       
    }
    
    
    func updateUI() {
        scoreLabel.text = "score : \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13 "
        progressBar.frame.size.width = (view.frame.size.width/13) * CGFloat(questionNumber+1)
      
    }
    

    func nextQuestion() {
        if questionNumber <= 12{

        questionLabel.text = allQuestion.list[questionNumber].questionText
           
            updateUI()
        }
        
        else{
           let alert = UIAlertController(title: "Awesome", message: "You Have Done, Start Over?", preferredStyle: .alert)
            let restart = UIAlertAction(title: "restart", style: .default, handler:
            {UIAlertAction
            in
            self.startOver()
            })
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer == pickedAnswer
        {
            ProgressHUD.showSuccess("Correct!")
            score = score + 1
        }
            // show success of answer - third part library
        else
        {
            ProgressHUD.showError("Wrong!")
        }
        //show error of answer - third part library
    }
    
    
    func startOver() {
        score = 0
        questionNumber = 0
        nextQuestion()
        
    }
    

    
}
