//
//  ViewController.swift
//  QuizDemo
//
//  Created by Appinventiv on 02/04/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var quesNo:Int = 0
    var score:Int = 0

    @IBOutlet weak var QuesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         nextQuestion()
      //  progressLabel.frame.size.height = 7

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1
             {
             pickedAnswer = true
             }
        else if sender.tag == 2
             {
            pickedAnswer = false
            }
        
        checkAnswer()
        self.ProgressView.progress += 0.08
        quesNo = quesNo+1
        nextQuestion()
    }
    
    func updateUI() {
        ScoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(quesNo + 1) / 13"
    }
    
    
    func nextQuestion()
     {
        if(quesNo <= 12){
        QuesLabel.text = allQuestions.list[quesNo].questionText
            updateUI()

        }
            else
             {
         let alert = UIAlertController(title: "Awsome", message: "Quiz is completed ,Do you want to restart??", preferredStyle: .alert)
            let restart = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                        self.startOver()
                        self.score = 0
                        self.quesNo = 0
                        self.ProgressView.progress = 0.1
                        self.updateUI()
                    })
                alert.addAction(restart)
                present(alert, animated: true, completion: nil)

            }
     }
    
    
    func checkAnswer()
     {
        let AnsCheck = allQuestions.list[quesNo].answer
        if pickedAnswer == AnsCheck
          {
            score = score + 1
            print("correct Answer")
          }
        else
          {
            print("wrong ans")
          }
        
     }
    
    
    func startOver()
     {
        quesNo = 0
        nextQuestion()
     }

}

