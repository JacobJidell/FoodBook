//
//  newRecipeCV.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-15.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class newRecipeCV: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleLbl: FloatLabelTextView!
    @IBOutlet weak var minuteLbl: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        titleLbl.textContainer.maximumNumberOfLines = 1;
    }

    // Changes the label value on how long time the the recipe will take to make
    @IBAction func minuteSliderValueChanged(sender: UISlider) {
        let value: Int = Int(sender.value)
        minuteLbl.text = String("\(value) minuter")
    }
    
    // Set maximum characters in  title label
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.characters.count // for Swift use count(newText)
        return numberOfChars <= 40
    }
}

extension newRecipeCV: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataService.instance.getCategories()[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let categoryChoice = DataService.instance.getCategories()[row].title
        print(categoryChoice)
    }
    
}
