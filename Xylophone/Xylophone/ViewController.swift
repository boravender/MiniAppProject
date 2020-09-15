//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var Button2: UIButton!
    
    @IBOutlet weak var Button3: UIButton!
    
    @IBOutlet weak var Button4: UIButton!
    
    @IBOutlet weak var Button5: UIButton!
    
    @IBOutlet weak var Button6: UIButton!
    
    @IBOutlet weak var Button7: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func ButtonPressed(_ sender: UIButton) {
        print("\(sender.currentTitle!)이 눌렸습니다")
        playSound(title: sender.currentTitle!)
    }


    

    func playSound(title: String) {
        guard let url = Bundle.main.url(forResource: "\(title)", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)


            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }


}

