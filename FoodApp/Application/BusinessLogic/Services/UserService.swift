//
//  UserService.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift

class UserService {
    func loadRecipes() -> Observable<[Recipe]> {
        let userDefaults = UserDefaults.standard
        let recipes = userDefaults.structArrayData(Recipe.self, forKey: .recipes)
        
        return Observable.just(recipes)
    }
}
