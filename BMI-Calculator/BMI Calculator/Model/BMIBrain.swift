//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by Boravender on 2020/09/17.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation

struct BMIBrain {
    func bmiCalculate(h: Float, w: Float) -> BMI {
        let result = w / (h * h)
        
        var bmi: BMI
        
        if result < 18.5 {
            bmi = BMI(value: result, advice: "under weight", color: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1))
        } else if result < 24.9 {
            bmi = BMI(value: result, advice: "normal weight", color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))
        } else {
            bmi = BMI(value: result, advice: "over weight", color: #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1))
        }
        
        return bmi
    }
}
