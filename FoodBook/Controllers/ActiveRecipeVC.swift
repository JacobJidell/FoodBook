//
//  ActiveRecipeVC.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-21.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class ActiveRecipeVC: UIViewController {

    @IBOutlet weak var titleLbl: UINavigationItem!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var instructionLbl: UILabel!
    @IBOutlet weak var ingredientsLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var activeRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storageRef = STORAGE_REF.child("\(USER_ID ?? "NO_USER")/\(activeRecipe.key).jpg")
        
        // Grabs the image data and converts it to UIImage and put it into the imageView
        storageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil { } else {
                self.imageView.image = UIImage(data: data!)
            }
        }
    
        titleLbl.title = activeRecipe.recipeName
        timeLbl.text = "\(activeRecipe.recipeTime) minuter"
        instructionLbl.text =  activeRecipe.instructions
        ingredientsLbl.text = activeRecipe.ingredients
    }

}
