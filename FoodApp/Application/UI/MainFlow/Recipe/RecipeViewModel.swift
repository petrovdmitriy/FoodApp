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
    var sectionModels: Driver<[RecipeSectionModel]> = .just([])
    
    init(withRecipe recipe: Recipe) {
        dataSource = .just(recipe)
    }
}

extension RecipeViewModel {
    func initSectionModels(withRecipe recipe: Recipe) {
        sectionModels = .just(setupSections(recipe: recipe))
    }
}

private extension RecipeViewModel {
    func setupSections(recipe: Recipe) -> [RecipeSectionModel] {
        let dataSource: [RecipeSectionModel] = [
            .recipe(items: [.image(imageData: recipe.image),
                            .about(text: "Total calories: \(recipe.totalCalories)"),
                            .about(text: isVegetarianCell(recipe.isVegetarian)),
                            .ingredients(ingredients: recipe.ingredients)])
        ]
        
        return dataSource
    }
    
    func isVegetarianCell(_ isVegetarian: Bool) -> String {
        if isVegetarian {
            return "Vegetarian recipe"
        } else {
            return "Non-Vegetarian recipe"
        }
    }
}
