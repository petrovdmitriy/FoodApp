//
//  IngredientsCellViewModel.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class IngredientsCellViewModel: DisposableViewModel {
    var dataSource: Driver<[Ingredient]>
    
    init(withIngredients ingredients: [Ingredient]) {
        dataSource = Driver.just(ingredients)
    }
}
