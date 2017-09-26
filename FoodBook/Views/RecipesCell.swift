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
    func configureCell(foodTitle: String, foodInfo: String, timeInfo: Int, imageKey: String){
        
        let storageRef = STORAGE_REF.child("\(USER_ID ?? "NO_USER")/\(imageKey).jpg")
        
        // Grabs the image data and converts it to UIImage and put it into the imageView
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil { } else {
                self.foodImageView.image = UIImage(data: data!)
            }
        }
        
        self.foodTitleLbl.text = foodTitle
        self.foodInfoLbl.text = foodInfo
        self.timeInfoLbl.text = "\(timeInfo) minuter"
    }

    

}
