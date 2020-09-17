//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightProgress: UISlider!
    
    @IBOutlet weak var weightProgress: UISlider!
    
    var bmibrain = BMIBrain()
    
    // class이기 때문에 intializer가 필요하기 때문에 옵셔널로 선언
    var result: BMI?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightProgress.maximumValue = 2.0
        weightProgress.maximumValue = 100
        weightProgress.value = 50
        
        heightLabel.text = String(heightProgress.value) + "m"
        weightLabel.text = String(weightProgress.value) + "Kg"
    }

    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + "m"
    }
    
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1f", sender.value) + "Kg"
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        result = bmibrain.bmiCalculate(h: heightProgress.value, w: weightProgress.value)
        
        // 화면 이동을 트리거하는 method
        performSegue(withIdentifier: "resultView", sender: self)
    }
    
    // 정보를 전달하는 method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 첫번째로 식별자 확인
        if segue.identifier == "resultView" {
            
            // destination type Casting해서 접근할 수 있게 함
            let resultVC = segue.destination as? ResultViewController
            resultVC?.result = result
            
        }
        
    }
    
}

