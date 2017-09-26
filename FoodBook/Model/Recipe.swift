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
    private var _recipeTime: Int
    private var _recipeInformation: String
    private var _ingredients: String
    private var _instructions: String
    private var _category: String
    private var _imageURL: String
    private var _key: String
    
    var recipeName: String {
        return _recipeName
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
    
    var imageURL: String {
        return _imageURL
    }
    
    var key: String {
        return _key
    }
    
    init(recipeName: String, recipeTime: Int, recipeInformation: String,
         ingredients: String, instructions: String, category: String, imageURL: String, key: String) {
        self._recipeName = recipeName
        self._recipeTime = recipeTime
        self._recipeInformation = recipeInformation
        self._ingredients = ingredients
        self._instructions = instructions
        self._category = category
        self._imageURL = imageURL
        self._key = key
    }
    
    
    
}
