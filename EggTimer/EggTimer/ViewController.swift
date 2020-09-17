//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var startTime = 0
    
    var totalTime = 0
    
    var timer: Timer?
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        
    }
    
    
    @IBAction func pressedButton(_ sender: UIButton) {
        
        // 진행중인 timer가 있다면 중지
        timer?.invalidate()
        
        if sender.currentTitle == "Soft" {
            countLabel.text = "5"
            startTime = 0
            totalTime = 5
        } else if sender.currentTitle == "Medium" {
            countLabel.text = "10"
            startTime = 0
            totalTime = 10
        } else {
            countLabel.text = "15"
            startTime = 0
            totalTime = 15
        }
        
        // 진행률 초기화
        progressBar.progress = 0.0
        
        // 1초마다 update 함수 실행
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
    }
    
    @objc func update() {
        
        startTime += 1
        
        progressBar.progress = Float(startTime) / Float(totalTime)
        
        if startTime == totalTime {
            timer?.invalidate()
            countLabel.text = "Done!"
            playsound()
            return
        }
        
        countLabel.text = "\(totalTime - startTime)"
    }
    
    func playsound() {
        
        // project file 경로에 접근하는 방법
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        // player instance 생성
        player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        
        // player는 Optional
        guard let player = player else { return }
        
        // 실제 사운드 플레이
        player.play()
        
    }
    
}
