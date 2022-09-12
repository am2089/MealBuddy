//
//  MealVC.swift
//  MealBuddy
//
//  Created by Andrew Muniz on 9/9/22.
//

import UIKit

class MealVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
 
    
    var meals = Meals()
    var filteredData = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
  
        
        
        
        meals.getMeals {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MealDetail"{
            let destination = segue.destination as! DetailVC
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.meal = meals.mealArray[selectedIndexPath.row]
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.mealArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row == meals.mealArray.count-1 && meals.alphabetIndex < meals.alphabet.count{
            meals.getMeals {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        cell.textLabel?.text = meals.mealArray[indexPath.row].strMeal
        return cell
    }

    
 
    
    
}

