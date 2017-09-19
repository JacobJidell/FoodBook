//
//  CategoryCell.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-11.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    // Set the label and the imageView from the categories for every category cell.
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }
}
