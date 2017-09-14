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

//Database reference
public let REF = Database.database().reference()
public let REF_USER = REF.child(USER_ID!)
public let REF_CATEGORIES = REF_USER.child("categories")
public var REF_ACTIVE_CATEGORY = REF_CATEGORIES.child(DataService.category!)

//Authenication, User ID
public let USER_ID = Auth.auth().currentUser?.uid

