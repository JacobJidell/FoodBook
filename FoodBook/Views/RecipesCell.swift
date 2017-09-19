//
//  RecipeCell.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-13.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class RecipesCell: UITableViewCell {

    @IBOutlet weak var foodTitleLbl: UILabel!
    @IBOutlet weak var foodInfoLbl: UILabel!
    @IBOutlet weak var timeInfoLbl: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    // Sets the data on the different labels in a cell
    func configureCell(foodTitle: String, foodInfo: String, timeInfo: Int, foodImage: String){
        self.foodTitleLbl.text = foodTitle
        self.foodInfoLbl.text = foodInfo
        self.timeInfoLbl.text = "\(timeInfo) minuter"
        self.foodImageView.image = UIImage(named: "\(foodImage)")
    }

    

}
