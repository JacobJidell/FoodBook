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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        categoryTitleSender = category.title
        performSegue(withIdentifier: "RecipeVC", sender: category)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipeVC = segue.destination as? RecipeVC {
            assert(sender as? Category != nil)
            recipeVC.setCategory(category: sender as! Category)
        }
    }
}

extension CategoryVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
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
