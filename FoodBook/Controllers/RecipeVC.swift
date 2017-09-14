//
//  RecipeVC.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-13.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class RecipeVC: UIViewController{
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var recipeTable: UITableView!
    
    var recipesArray = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTable.dataSource = self
        recipeTable.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllRecipes { (returnedRecipeArray) in
            self.recipesArray = returnedRecipeArray
            self.recipeTable.reloadData()
        }
    }
    
    func setCategory(category: Category) {
        DataService.category = category.title
    }
    
    
}

extension RecipeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as? RecipesCell else {
            return UITableViewCell()
        }
        let recipe = recipesArray[indexPath.row]
        
        cell.configureCell(foodTitle: recipe.recipeName, foodInfo: recipe.recipeInformation, timeInfo: recipe.recipeTime, foodImage: recipe.recipeImageName)
        return cell
    }
}
