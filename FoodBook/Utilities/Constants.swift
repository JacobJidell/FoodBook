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
    Category(title: "Kött", imageName: "meat.png"),
    Category(title: "Vegetariskt", imageName: "vegetarian.png"),
    Category(title: "Fisk", imageName: "fish.png"),
    Category(title: "Grillat", imageName: "barbeque.png"),
    Category(title: "Pasta", imageName: "pasta.png"),
    Category(title: "Bakverk", imageName: "fika.png"),
    Category(title: "Bröd", imageName: "bread.png")
]
