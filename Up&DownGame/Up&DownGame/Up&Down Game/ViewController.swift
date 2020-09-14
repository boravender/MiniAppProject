//
//  ViewController.swift
//  Up&Down Game
//
//  Created by Boravender on 2020/09/14.
//  Copyright © 2020 Boravender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var DisplayLabel: UILabel!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MainLabel.text = "HELLO"
        
        number = Int.random(in: 0...9)
    }
    
    
    @IBAction func NumberButton(_ sender: UIButton) {
        DisplayLabel.text = sender.currentTitle!
    }
    
    @IBAction func CheckButton(_ sender: UIButton) {
        guard let text = DisplayLabel.text else { return }
        guard let checkingNumber = Int(text) else { return }
        
        if number > checkingNumber {
            MainLabel.text = "UP"
        } else if number < checkingNumber {
            MainLabel.text = "Down"
        } else {
            MainLabel.text = "Bingo"
        }
    }
    
    
    @IBAction func ResetButton(_ sender: UIButton) {
        DisplayLabel.text = ""
        MainLabel.text = "Hello"
        number = Int.random(in: 0...9)
        
    }
    
}

