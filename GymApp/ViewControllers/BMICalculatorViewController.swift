//
//  BMICalculatorViewController.swift
//  GymApp
//
//  Created by Bryan Albrecht on 16.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    
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
        
    }
}
