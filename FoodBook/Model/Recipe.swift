//
//  Recipe.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-13.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import Foundation

struct Recipe {
    
    var recipeName: String
    var recipeTime: Int
    var recipeInformation: String
    var ingredients: String
    var instructions: String
    var category: String
    var imageURL: String
    var key: String
    
    init(recipeName: String, recipeTime: Int, recipeInformation: String,
         ingredients: String, instructions: String, category: String, imageURL: String, key: String) {
        self.recipeName = recipeName
        self.recipeTime = recipeTime
        self.recipeInformation = recipeInformation
        self.ingredients = ingredients
        self.instructions = instructions
        self.category = category
        self.imageURL = imageURL
        self.key = key
    }
}
