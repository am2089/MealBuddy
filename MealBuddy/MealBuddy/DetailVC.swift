//
//  DetailVC.swift
//  MealBuddy
//
//  Created by Andrew Muniz on 9/9/22.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var recipeTextView: UITextView!
    
    var meal: Meal!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if meal == nil {
            meal = Meal()
        }
       updateUserInterface()
        
        mealImageView.layer.cornerRadius = 10
    }
    
    func updateUserInterface() {
        mealLabel.text = meal.strMeal
        recipeTextView.text = meal.strInstructions
        createIngredientsList()
        
        
        // Image loader
        guard let url = URL(string: meal.strMealThumb ?? "") else {return}
        do {
          let data = try Data(contentsOf: url)
            self.mealImageView.image = UIImage(data: data)
        } catch {
            print("Error: Could not get image from url \(url)")
        }
    }
    
    func addIngredients(measure: String?, ingredient: String?) {
        guard measure != nil else {return}
        ingredientsTextView.text += measure!
        guard ingredient != nil else {return}
        ingredientsTextView.text += " \(ingredient!)\n"
        
    }
    
    func createIngredientsList() {
        ingredientsTextView.text = ""
        
        addIngredients(measure: meal.strMeasure1, ingredient: meal.strIngredient1)
        addIngredients(measure: meal.strMeasure2, ingredient: meal.strIngredient2)
        addIngredients(measure: meal.strMeasure3, ingredient: meal.strIngredient3)
        addIngredients(measure: meal.strMeasure4, ingredient: meal.strIngredient4)
        addIngredients(measure: meal.strMeasure5, ingredient: meal.strIngredient5)
        addIngredients(measure: meal.strMeasure6, ingredient: meal.strIngredient6)
        addIngredients(measure: meal.strMeasure7, ingredient: meal.strIngredient7)
        addIngredients(measure: meal.strMeasure8, ingredient: meal.strIngredient8)
        addIngredients(measure: meal.strMeasure9, ingredient: meal.strIngredient9)
        addIngredients(measure: meal.strMeasure10, ingredient: meal.strIngredient10)
        addIngredients(measure: meal.strMeasure11, ingredient: meal.strIngredient11)
        addIngredients(measure: meal.strMeasure12, ingredient: meal.strIngredient12)
        addIngredients(measure: meal.strMeasure13, ingredient: meal.strIngredient13)
        addIngredients(measure: meal.strMeasure14, ingredient: meal.strIngredient14)
        addIngredients(measure: meal.strMeasure15, ingredient: meal.strIngredient15)
        addIngredients(measure: meal.strMeasure16, ingredient: meal.strIngredient16)
        addIngredients(measure: meal.strMeasure17, ingredient: meal.strIngredient17)
        addIngredients(measure: meal.strMeasure18, ingredient: meal.strIngredient18)
        addIngredients(measure: meal.strMeasure19, ingredient: meal.strIngredient19)
        addIngredients(measure: meal.strMeasure20, ingredient: meal.strIngredient20)
        
        if ingredientsTextView.text != "" {
            ingredientsTextView.text.removeLast()
        }
    }
    

    @IBAction func cancelButton(_ sender: Any) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    

}
