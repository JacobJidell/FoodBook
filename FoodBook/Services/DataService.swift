//
//  DataService.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-11.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import Foundation

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
}

