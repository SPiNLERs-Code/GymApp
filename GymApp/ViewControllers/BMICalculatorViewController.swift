//
//  BMICalculatorViewController.swift
//  GymApp
//
//  Created by Bryan Albrecht on 16.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import UIKit
import os.log

class BMICalculatorViewController: UIViewController {
    
    private let bmiCalculatorService = BMIService()
    
    @IBOutlet weak var heightTextBox: UITextField!
    @IBOutlet weak var weightTextBox: UITextField!
    @IBOutlet weak var bmiTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextBox.keyboardType = UIKeyboardType.numberPad
        weightTextBox.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        if heightTextBox.text?.isEmpty ?? true {return}
        if weightTextBox.text?.isEmpty ?? true {return}
        
        let height = Int(heightTextBox.text!)!
        let weight = Int(weightTextBox.text!)!
        var bmi: Double
        
        do {
            bmi = try bmiCalculatorService.calculateBMI(height: height, weight: weight)
            bmiTextBox.text = String(bmi)
        }catch ArgumentError.invalidArgumentError(let errorMessage){
            print(errorMessage)
            os_log("This is a log message.")
            os_log("This is additional info that may be helpful for troubleshooting.", log: OSLog.default, type: .info)
            let customLog = OSLog(subsystem: "com.your_company.your_subsystem_name.plist", category: "your_category_name")
            os_log("This is info that may be helpful during development or debugging.", log: customLog, type: .debug)
        }catch{
            print("Unexpected error: \(error).")
        }
        
        
    }
}
