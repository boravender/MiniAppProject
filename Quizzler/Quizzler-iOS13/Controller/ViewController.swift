//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var tuture: UIButton!
    
    @IBOutlet weak var fafalse: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫번째 문제 띄우기
        questionLabel.text = quiz.array[quiz.number].q
        progressBar.progress = Float(quiz.number) * 0.1
    }
    
    
    @IBAction func trueButton(_ sender: UIButton) {
        // 정답이면 background color 초록색, 틀리면 빨간색으로 바꾸기
        // 정답이면 Score 점수 올리기
        // 한문제당 progress.progress 1씩 올리기
        // 10번째 문제면 다음 화면으로 넘기기
        
        if quiz.ask(userAnswer: true) == true {
            tuture.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        } else {
            tuture.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        }
        
        
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
    }
    
    
    @IBAction func falseButton(_ sender: UIButton) {
        // 정답이면 background color 초록색, 틀리면 빨간색으로 바꾸기
        // 정답이면 Score 점수 올리기
        // 한문제당 progress.progress 1씩 올리기
        // 10번째 문제면 다음 화면으로 넘기기
        
        if quiz.ask(userAnswer: false) == true {
            fafalse.backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        } else {
            fafalse.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        }
        
  
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    
    
    @objc func update() {
        tuture.backgroundColor = .clear
        fafalse.backgroundColor = .clear
        
        
        if quiz.number == 9 {
            performSegue(withIdentifier: "toResult", sender: self)
            quiz.returnTo()
        }
            progressBar.progress = Float(quiz.number) * 0.1
            scoreLabel.text = "Score: " + String(quiz.letMeKnowScore())
            questionLabel.text = quiz.array[quiz.number].q
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultVC = segue.destination as? ResultViewController
            resultVC?.score = quiz.letMeKnowScore()
        }
    }
    
    
    
}
