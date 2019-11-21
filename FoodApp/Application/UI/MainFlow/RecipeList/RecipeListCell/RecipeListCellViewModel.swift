//
//  RecipeListCellViewModel.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class RecipeListCellViewModel: DisposableViewModel {
    var name: Driver<String>
    var calories: Driver<String>
    var isVegetarian: Driver<Bool>
    var imageData: Driver<Data>
    
    init(withRecipe recipe: Recipe) {
        name = Driver.just(recipe.name)
        calories = Driver.just("Total calories: \(recipe.totalCalories)")
        isVegetarian = Driver.just(recipe.isVegetarian)
        imageData = Driver.just(recipe.image)
    }
}
