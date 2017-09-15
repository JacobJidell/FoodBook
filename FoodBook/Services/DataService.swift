//
//  DataService.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-11.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import Foundation
import Firebase

var categoryTitleSender: String?

class DataService {
    static let instance = DataService()
    
    private let Categories = [
        Category(title: "Kött", imageName: "meat.png"),
        Category(title: "Vegetariskt", imageName: "vegetarian.png"),
        Category(title: "Fisk", imageName: "fish.png"),
        Category(title: "Grillat", imageName: "barbeque.png"),
        Category(title: "Pasta", imageName: "pasta.png"),
        Category(title: "Bakverk", imageName: "fika.png"),
        Category(title: "Bröd", imageName: "bread.png")
    ]
    
    func getCategories() -> [Category] {
        return Categories
    }
    
    func getAllRecipes(handler: @escaping (_ recipe: [Recipe]) -> ()) {
        var recipeArray = [Recipe]()
        let titleSender: String = categoryTitleSender!
        REF_CATEGORIES.child(titleSender).observeSingleEvent(of: .value) { (recipeSnapshot) in
            guard let recipeSnapshot = recipeSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for recipe in recipeSnapshot {
                let recipeName = recipe.childSnapshot(forPath: "Name").value as! String
                let recipeTime = recipe.childSnapshot(forPath: "Time").value as! Int
                let recipeImageName = recipe.childSnapshot(forPath: "ImageName").value as! String
                let recipeInfo = recipe.childSnapshot(forPath: "Information").value as! String
                let recipeInstructions = recipe.childSnapshot(forPath: "Instruction").value as! String
                let recipeIngredients = recipe.childSnapshot(forPath: "Ingredients").value as! String
                let recipe = Recipe(recipeName: recipeName, recipeImageName: recipeImageName, recipeTime: recipeTime, recipeInformation: recipeInfo, ingredients: recipeIngredients, instructions: recipeInstructions)
                recipeArray.append(recipe)
            }
            handler(recipeArray)
        }
    }
}

