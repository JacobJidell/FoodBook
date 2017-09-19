//
//  ViewController.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-08.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit
import Firebase

class CategoryVC: UIViewController {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    
    // On click, perform segue to RecipeVC with the sender category
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "RecipeVC", sender: category)
        
    }
    
    // Prepare for the segue with the function setCategory
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeVC = segue.destination as? RecipesVC {
            assert(sender as? Category != nil)
            recipeVC.setCategory(category: sender as! Category)
        }
    }
}

extension CategoryVC: UITableViewDataSource, UITableViewDelegate {
    
    // Get the length of the category array and have it as rows.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    // Resuing cells to prevent further lag
    // Getting the categories at the specific index and updates the view for that cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
}
