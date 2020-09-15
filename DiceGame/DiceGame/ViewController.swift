//
//  ViewController.swift
//  DiceGame
//
//  Created by Boravender on 2020/09/15.
//  Copyright © 2020 Boravender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Dice: UIImageView!
    
    @IBOutlet weak var Dice1: UIImageView!
    
    var image = [#imageLiteral(resourceName: "dice1"),#imageLiteral(resourceName: "dice2"),#imageLiteral(resourceName: "dice3"),#imageLiteral(resourceName: "dice4"),#imageLiteral(resourceName: "dice5"),#imageLiteral(resourceName: "dice6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func RollButton(_ sender: UIButton) {
        Dice.image = image.randomElement()
        Dice1.image = image.randomElement()
    }
    
}

