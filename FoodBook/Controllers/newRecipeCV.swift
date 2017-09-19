//
//  newRecipeCV.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-15.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class newRecipeCV: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var ingridientsLbl: UILabel!
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var informationLbl: UILabel!
    @IBOutlet weak var instructionsLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Changes the label value on how long time the the recipe will take to make
    @IBAction func minuteSliderValueChanged(sender: UISlider) {
        let value: Int = Int(sender.value)
        minuteLbl.text = String("\(value) minuter")
    }
    
}

