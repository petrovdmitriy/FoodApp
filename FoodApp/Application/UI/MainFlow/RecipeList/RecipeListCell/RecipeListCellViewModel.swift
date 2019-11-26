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
        name = .just(recipe.name)
        calories = .just("Total calories: \(recipe.totalCalories)")
        isVegetarian = .just(recipe.isVegetarian)
        imageData = .just(recipe.image)
    }
}
