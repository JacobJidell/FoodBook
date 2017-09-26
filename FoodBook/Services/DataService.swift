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
    
    // Grabs the data from firebase
    // If something is equal nil, it's using @escaping, which quits the function and prevents crash
    // The object we're getting from the dataSnapshot is all the data we're getting from that node
    // We're using a for loop to seperate all the data into different recipes and converts all the different datatypes into our own specific types; etc. String and Int.
    // We then put every new recipe into our recipeArray
    func getAllRecipes(handler: @escaping (_ recipe: [Recipe]) -> ()) {
        var recipeArray = [Recipe]()
        let titleSender: String = categoryTitleSender!
        REF_CATEGORIES.child(titleSender).observeSingleEvent(of: .value) { (recipeSnapshot) in
            guard let recipeSnapshot = recipeSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for recipe in recipeSnapshot {
                let recipeName = recipe.childSnapshot(forPath: "Name").value as! String
                let recipeTime = recipe.childSnapshot(forPath: "Time").value as! Int
                let recipeInfo = recipe.childSnapshot(forPath: "Information").value as! String
                let recipeInstructions = recipe.childSnapshot(forPath: "Instruction").value as! String
                let recipeIngredients = recipe.childSnapshot(forPath: "Ingredients").value as! String
                let recipeCategory = recipe.childSnapshot(forPath: "Category").value as! String
                let imageURL = recipe.childSnapshot(forPath: "ImageURL").value as! String
                let recipeKey = recipe.childSnapshot(forPath: "Key").value as! String
                let recipe = Recipe(recipeName: recipeName, recipeTime: recipeTime, recipeInformation: recipeInfo, ingredients: recipeIngredients, instructions: recipeInstructions, category: recipeCategory, imageURL: imageURL, key: recipeKey)
                recipeArray.append(recipe)
            }
            handler(recipeArray)
        }
    }
    
    // Saves data and images to firebase
    func upLoadNewRecipe(recipe: Recipe, image: UIImage) {
        
        var imgURL: Any?
        let category = recipe.category
        
        // Generates a random key
        let rndKey = REF.childByAutoId().key
        
        // Storage reference
        let recipeImageRef = STORAGE_REF.child("\(USER_ID ?? "NO_USER")/\(rndKey).jpg")
        
        // Uploading the image
        if let newImage = UIImageJPEGRepresentation(image, 0.1){
            recipeImageRef.putData(newImage, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    print("Error uploading the image")
                } else {
                    imgURL = metadata?.downloadURL()?.absoluteString
                    REF_CATEGORIES.child(category).child(rndKey).child("ImageURL").setValue(imgURL)
                }
            })
        }
        
        // Create the object to send in to firebase
        let recipeObject: [String: Any] = [
            "Category": recipe.category,
            "Information": recipe.recipeInformation,
            "Ingredients": recipe.ingredients,
            "Instruction": recipe.instructions,
            "Name": recipe.recipeName,
            "Time": recipe.recipeTime,
            "Key": rndKey
        ]
        
        // Set the value into firebase
        REF_CATEGORIES.child(category).child(rndKey).setValue(recipeObject)
    }
    
    // Removes the data from firebase and Storage
    func removeFromFirebase(recipe: Recipe) {
        // Removes the data from firebase
        REF_CATEGORIES.child(recipe.category).child(recipe.key).setValue(nil)
        
        let recipeImageRef = STORAGE_REF.child("\(USER_ID ?? "NO_USER")/\(recipe.key).jpg")
        
        // Delete the file
        recipeImageRef.delete { error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // File deleted successfully
            }
        }
    }
}

