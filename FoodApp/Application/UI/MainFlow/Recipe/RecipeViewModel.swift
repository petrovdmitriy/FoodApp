//
//  RecipeViewModel.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift

class RecipeViewModel: DisposableViewModel {
    var dataSource: Driver<Recipe>
    
    init(withRecipe recipe: Recipe) {
        dataSource = Driver.just(recipe)
    }
}
