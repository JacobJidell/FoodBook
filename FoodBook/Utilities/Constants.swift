//
//  Constants.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-12.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

// Database reference
let REF = Database.database().reference()
let REF_USER = REF.child(USER_ID!)
let REF_CATEGORIES = REF_USER.child("categories")

// Authenication, User ID
let USER_ID = Auth.auth().currentUser?.uid

// Firebase storage
let STORAGE = Storage.storage()
let STORAGE_REF = Storage.storage().reference()


// All the categories
let CATEGORIES = [
    Category(title: "Kött", imageName: "meat.jpg"),
    Category(title: "Vegetariskt", imageName: "vegetarian.jpg"),
    Category(title: "Fisk", imageName: "fish.jpg"),
    Category(title: "Grillat", imageName: "barbeque.jpg"),
    Category(title: "Pasta", imageName: "pasta.jpg"),
    Category(title: "Bakverk", imageName: "fika.jpg"),
    Category(title: "Bröd", imageName: "bread.jpg")
]
