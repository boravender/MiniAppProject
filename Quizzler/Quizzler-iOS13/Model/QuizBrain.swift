//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Boravender on 2020/09/18.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class QuizBrain {
    
    let array =
    [Quiz(q: "초코의 별명은 쪼꾸라미이다", a: true),
    Quiz(q: "보리의 별명은 자잔바리이다", a: false),
    Quiz(q: "초코의 나이는 11살이다", a: true),
    Quiz(q: "보리의 나이는 5살이다", a: false),
    Quiz(q: "초코는 그르릉 소리를 자주 낸다", a: true),
    Quiz(q: "보리는 산책을 싫어한다", a: false),
    Quiz(q: "초코가 가장 좋아하는 사람은 아빠이다", a: true),
    Quiz(q: "보리가 가장 좋아하는 사람은 보라이다", a: false),
    Quiz(q: "초코는 고기가 없으면 밥을 안먹는다", a: true),
    Quiz(q: "보리는 개껌이 없으면 밥을 안먹는다", a: false)]
    
    var number = 0
    var score = 0
    
    
    func ask(userAnswer: Bool) -> Bool {
        
        if array[number].a == userAnswer {
            score += 1
            if number == 9 {
                number = 0
                score = 0
            } else {
                number += 1
            }
            return true
            
        } else {
            
            if number == 9 {
                number = 0
                score = 0
            } else {
                number += 1
            }
            return false
        }
    }
    
    
    func letMeKnowScore() -> Int {
        return score
    }
    
    func returnTo() {
        number = 0
        score = 0
    }
    
}
