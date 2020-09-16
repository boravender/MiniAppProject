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
        
        // playground 함수 실행
        playSound(title: sender.currentTitle!)
        
        sender.alpha = 0.5
        
        // Type method
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: false)
        
        // 위와 같은 동작을 함
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
//
//            self.Button.alpha = 1.0
//            self.Button2.alpha = 1.0
//            self.Button3.alpha = 1.0
//            self.Button4.alpha = 1.0
//            self.Button5.alpha = 1.0
//            self.Button6.alpha = 1.0
//            self.Button7.alpha = 1.0
//
//        }
        
    
    }
    
    // 버튼의 alpha 돌리기
    @objc func update() {
        Button.alpha = 1.0
        Button2.alpha = 1.0
        Button3.alpha = 1.0
        Button4.alpha = 1.0
        Button5.alpha = 1.0
        Button6.alpha = 1.0
        Button7.alpha = 1.0
    }
    
    


    
    // playground 함수를 만들어서 버튼이 눌렸을 때 실행
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

