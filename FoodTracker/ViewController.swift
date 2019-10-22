//
//  ViewController.swift
//  FoodTracker
//
//  Created by jodia luxcon on 2019/10/21.
//

import UIKit

class ViewController: UIViewController {
//MARK:Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//MARK:Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    

}

