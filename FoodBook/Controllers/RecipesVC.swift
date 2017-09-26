//
//  RecipeVC.swift
//  FoodBook
//
//  Created by Jacob Ahlberg on 2017-09-13.
//  Copyright © 2017 Jacob Ahlberg. All rights reserved.
//

import UIKit

class RecipesVC: UIViewController{
    
    @IBOutlet weak var categoryTitleLbl: UINavigationItem!
    @IBOutlet weak var recipeTable: UITableView!
    
    var recipesArray = [Recipe]()
    var refresherCtrl: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTable.dataSource = self
        recipeTable.delegate = self
    }
    
    // Grabs the data from the function getAllRecipes and set the value as the recipeArray
    // Also reload the tableView data
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllRecipes { (returnedRecipeArray) in
            self.recipesArray = returnedRecipeArray
            self.recipeTable.reloadData()
        }
    }
    
    // Grabs the category title and set it as the active category label
    func setCategory(category: Category) {
        categoryTitleSender = category.title
        categoryTitleLbl.title = category.title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chosenRecipe: Recipe = recipesArray[indexPath.row]
        performSegue(withIdentifier: "chosenRecipeVC", sender: chosenRecipe)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let activeRecipeVC = segue.destination as? ActiveRecipeVC {
            activeRecipeVC.activeRecipe = sender as? Recipe
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Removes data from firebase and storage when sliding the cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let chosenRecipe: Recipe = recipesArray[indexPath.row]
            DataService.instance.removeFromFirebase(recipe: chosenRecipe)
            tableView.reloadData()
            refreshTableView()
        }
    }
    
    // Refreshes the tableview
    @objc func refreshTableView() {
        DataService.instance.getAllRecipes { (returnedRecipeArray) in
            self.recipesArray = returnedRecipeArray
            self.recipeTable.reloadData()
            self.refresherCtrl.endRefreshing()
        }
    }
}

extension RecipesVC: UITableViewDelegate, UITableViewDataSource {
    
    // Using one section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Get the length of the array as rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesArray.count
    }
    
    // Resuing cells to prevent further lag
    // Getting the recipes at the specific index from the recipesArray
    // Configuring the cell with the correct data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as? RecipesCell else { return UITableViewCell() }
        let recipe = recipesArray[indexPath.row]
        
        cell.configureCell(foodTitle: recipe.recipeName, foodInfo: recipe.recipeInformation,
                           timeInfo: recipe.recipeTime, imageKey: recipe.key)
        return cell
    }
}
