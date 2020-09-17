//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Boravender on 2020/09/17.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result: BMI?
    
    @IBOutlet weak var valueLabel: UILabel!
    
    
    @IBOutlet weak var adviceLabel: UILabel!
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        firstSetting()
        
    }
    
    func firstSetting() {
        
        guard let result = result else { return }
        
        valueLabel.text = String(format: "%.2f", result.value)
        adviceLabel.text = result.advice
        backgroundImageView.backgroundColor = result.color
    }
    
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
