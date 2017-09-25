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
    
    var activeRecipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.title = activeRecipe.recipeName
        timeLbl.text = "\(activeRecipe.recipeTime) minuter"
        instructionLbl.text =  activeRecipe.instructions
        ingredientsLbl.text = activeRecipe.ingredients
    }

}
