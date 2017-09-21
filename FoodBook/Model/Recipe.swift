//
//  Recipe.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-13.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import Foundation

struct Recipe {
    
    private var _recipeName: String
    private var _recipeImageName: String
    private var _recipeTime: Int
    private var _recipeInformation: String
    private var _ingredients: String
    private var _instructions: String
    private var _category: String
    
    var recipeName: String {
        return _recipeName
    }
    
    var recipeImageName: String {
        return _recipeImageName
    }
    
    var recipeTime: Int {
        return _recipeTime
    }
    
    var recipeInformation: String {
        return _recipeInformation
    }
    
    var ingredients: String {
        return _ingredients
    }
    
    var instructions: String {
        return _instructions
    }
    
    var category: String {
        return _category
    }
    
    init(recipeName: String, recipeImageName: String, recipeTime: Int, recipeInformation: String,
         ingredients: String, instructions: String, category: String) {
        self._recipeName = recipeName
        self._recipeImageName = recipeImageName
        self._recipeTime = recipeTime
        self._recipeInformation = recipeInformation
        self._ingredients = ingredients
        self._instructions = instructions
        self._category = category
    }
    
    
    
}
