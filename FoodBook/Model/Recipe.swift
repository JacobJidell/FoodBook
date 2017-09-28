//
//  Recipe.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-13.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import Foundation

struct Recipe {
    
    public private(set) var recipeName: String
    public private(set) var recipeTime: Int
    public private(set) var recipeInformation: String
    public private(set) var ingredients: String
    public private(set) var instructions: String
    public private(set) var category: String
    public private(set) var imageURL: String
    public private(set) var key: String
    
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
