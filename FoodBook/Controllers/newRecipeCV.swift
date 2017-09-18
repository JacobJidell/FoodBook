//
//  newRecipeCV.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-15.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class newRecipeCV: UIViewController {

    @IBOutlet weak var minuteLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
    }

    @IBAction func minuteSliderValueChanged(sender: UISlider) {
        var value: Int = Int(sender.value)
        minuteLbl.text = String("\(value) minuter")
    }
    
}

