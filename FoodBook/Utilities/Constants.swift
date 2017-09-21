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
public let REF = Database.database().reference()
public let REF_USER = REF.child(USER_ID!)
public let REF_CATEGORIES = REF_USER.child("categories")

// Authenication, User ID
public let USER_ID = Auth.auth().currentUser?.uid

// Firebase storage
public let STORAGE = Storage.storage()
public let STORAGE_REF = Storage.storage().reference()
