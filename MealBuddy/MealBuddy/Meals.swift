//
//  MealModel.swift
//  MealBuddy
//
//  Created by Andrew Muniz on 9/9/22.
//

import Foundation

class Meals {
    
    struct Returned: Codable {
        var meals: [Meal]
    }
    
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var alphabetIndex = 0
    
    var urlBase = "https://www.themealdb.com/api/json/v1/1/search.php?f="
    var urlString = ""
    var mealArray: [Meal] = []
    var isFetching = false
    
    
    func getMeals(completed: @escaping ()->()) {
        guard !isFetching else {
            print("Did not call getMeals here because we have not fetched data.")
            completed()
            return
        }
        isFetching = true
        
        urlString = urlBase + alphabet[alphabetIndex]
        print("We are accessing the url \(urlString)")
        
        alphabetIndex += 1
    
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("Error: Could no create a url from\(urlString)")
            isFetching = false
            completed()
            return
        }
        
        // Create session
        let session = URLSession.shared
        
        // Get data with .dataTask method
        let task = session.dataTask(with: url){ data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        // Data
            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data!)
                self.mealArray += returned.meals
            } catch {
                print("JSON Error: \(error.localizedDescription)")
                
            }
            self.isFetching = false
            completed()
        }
        task.resume()
    }
}
