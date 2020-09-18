//
//  ResultViewController.swift
//  Quizzler-iOS13
//
//  Created by Boravender on 2020/09/18.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score = 0
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(score) + "점"
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        //dismiss(animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    

}
