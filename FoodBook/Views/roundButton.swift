//
//  RoundedCorners.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-18.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

@IBDesignable
class roundButton: UIButton {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        customButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customButton()
    }
    
    // Makes the corner rounder
    func customButton(){
        layer.cornerRadius = 5
    }
    

}
