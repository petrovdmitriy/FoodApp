//
//  IngredientService.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit

class IngredientService {
    static let pasta = Ingredient(name: "Pasta", weight: 150, needsCooking: true, isVegetarian: true, image: #imageLiteral(resourceName: "pasta").jpegData(compressionQuality: 0.95) ?? Data())
    static let rice = Ingredient(name: "Rice", weight: 150, needsCooking: true, isVegetarian: true, image: #imageLiteral(resourceName: "rice").jpegData(compressionQuality: 0.95) ?? Data())
    
    static let chickenBreast = Ingredient(name: "Chicken Breast", weight: 150, needsCooking: true, isVegetarian: false, image: #imageLiteral(resourceName: "chicken").jpegData(compressionQuality: 0.95) ?? Data())
    static let pork = Ingredient(name: "Pork", weight: 100, needsCooking: true, isVegetarian: false, image: #imageLiteral(resourceName: "pork").jpegData(compressionQuality: 0.95) ?? Data())
    static let eggs = Ingredient(name: "Eggs", weight: 100, needsCooking: true, isVegetarian: false, image: #imageLiteral(resourceName: "eggs").jpegData(compressionQuality: 0.95) ?? Data())
    static let bacon = Ingredient(name: "Bacon", weight: 50, needsCooking: true, isVegetarian: false, image: #imageLiteral(resourceName: "bacon").jpegData(compressionQuality: 0.95) ?? Data())
    
    static let mayoSauce = Ingredient(name: "Mayo sauce", weight: 20, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "mayo").jpegData(compressionQuality: 0.95) ?? Data())
    
    static let berries = Ingredient(name: "Berries", weight: 50, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "berries").jpegData(compressionQuality: 0.95) ?? Data())
    static let banana = Ingredient(name: "Banana", weight: 50, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "banana").jpegData(compressionQuality: 0.95) ?? Data())
    static let apple = Ingredient(name: "Apple", weight: 50, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "apple").jpegData(compressionQuality: 0.95) ?? Data())
    static let salad = Ingredient(name: "Salad", weight: 20, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "salad").jpegData(compressionQuality: 0.95) ?? Data())
    static let tomatoes = Ingredient(name: "Tomatoes", weight: 50, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "tomatoes").jpegData(compressionQuality: 0.95) ?? Data())
    static let garlic = Ingredient(name: "Garlic", weight: 10, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "garlic").jpegData(compressionQuality: 0.95) ?? Data())
    static let potatoes = Ingredient(name: "Potatoes", weight: 200, needsCooking: true, isVegetarian: true, image: #imageLiteral(resourceName: "potatoes").jpegData(compressionQuality: 0.95) ?? Data())
    static let parsley = Ingredient(name: "Parsley", weight: 20, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "parsley").jpegData(compressionQuality: 0.95) ?? Data())
    static let pepper = Ingredient(name: "Pepper", weight: 50, needsCooking: false, isVegetarian: true, image: #imageLiteral(resourceName: "pepper").jpegData(compressionQuality: 0.95) ?? Data())
}
