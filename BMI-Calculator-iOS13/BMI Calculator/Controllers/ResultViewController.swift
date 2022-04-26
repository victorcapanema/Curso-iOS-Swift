//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by FoRcE on 18/04/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValor: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var resultValue: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var rbackgroundRes: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultValue.text = bmiValor
        adviceLabel.text = advice
        rbackgroundRes.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
