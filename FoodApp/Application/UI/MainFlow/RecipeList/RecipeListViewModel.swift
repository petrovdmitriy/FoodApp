//
//  RecipeListViewModel.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift

class RecipeListViewModel: DisposableViewModel {
    var dataSource = BehaviorRelay<[Recipe]>(value: [])
    
    
    private let defaultRecipes = [RecipeService.chickenPasta,
                                  RecipeService.baconRice,
                                  RecipeService.eggPorkRice]
    
    init(withRecipes recipes: [Recipe]) {
        if recipes.isEmpty {
            dataSource.accept(defaultRecipes)
        } else {
            dataSource.accept(recipes)
        }
    }
}

