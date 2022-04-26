//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by FoRcE on 19/04/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    var bmi: BMI?
    
    mutating func calculateBMI(weight: Float, height: Float){
        let bmiValue: Float = weight / pow(height,2)
        
        if (bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: .cyan)
        }else if(bmiValue <= 24.9) {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: .red)
        }
    }
        
        func getBMIValue() -> String{
            return "\(String(format: "%0.2f" ,bmi?.value ?? 0.0))"
        }
        
    func getColor() -> UIColor{
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String{
        return bmi?.advice ?? "No advices for you."
    }
        
    }
