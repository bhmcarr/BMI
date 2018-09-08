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
    @IBOutlet weak var feetField: UITextField!
    @IBOutlet weak var inchField: UITextField!
    
    
    @IBOutlet weak var resultField: UILabel!
    @IBOutlet weak var statusField: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        // close the keyboard upon hitting the button,
        // from either text field (this is clunky)
        weightField.resignFirstResponder()
        feetField.resignFirstResponder()
        inchField.resignFirstResponder()

        let weight: String = weightField.text!
        let feet: String = feetField.text!
        let inches: String = inchField.text!
        
        let doubleWeight = Double(weight)
        let doubleFeet = Double(feet)
        let doubleInches = Double(inches)
        
        let doubleHeight = (12 * doubleFeet!) + doubleInches!
        
        print("Weight: \(weight)")
        print("Height: \(feet)ft \(inches)in")
        
        let bmi: Double = calcBMI(weight: doubleWeight ?? 0, height: doubleHeight ?? 0)
        
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
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        weightField.text = ""
        feetField.text = ""
        inchField.text = ""
        resultField.text = "0"
        statusField.text = ""
    }
    
}

