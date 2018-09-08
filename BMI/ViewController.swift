//
//  ViewController.swift
//  BMI
//
//  Created by Brandon on 9/7/18.
//  Copyright © 2018 Brandon Carr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var resultField: UILabel!
    @IBOutlet weak var statusField: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // close the keyboard upon hitting the button,
        // from either text field (this is clunky)
        weightField.resignFirstResponder()
        heightField.resignFirstResponder()
        let weight: String = weightField.text!
        let height: String = heightField.text!

        print("Weight: \(weight)")
        print("Height: \(height)")
        
        let doubleWeight = Double(weight)
        let doubleHeight = Double(height)
        
        let bmi: Double = calcBMI(weight: doubleWeight!, height: doubleHeight!)
        
        resultField.text = String(round(10*bmi)/10)
        
        if (bmi > 30){
            statusField.text = "Obese"
        }
        else if (bmi > 25){
            statusField.text = "Overweight"
        }
        else if (bmi > 18.5){
            statusField.text = "Normal Weight"
        }
        else{
            statusField.text = "Underweight"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func calcBMI(weight: Double, height: Double) -> Double{
        let bmi : Double = 703 * weight / pow(height,2)
        print("BMI: \(bmi)")
        return bmi
    }
    
}

