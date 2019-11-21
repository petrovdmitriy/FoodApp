//
//  FoodComponent.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 19/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit

struct Ingredient: Codable {
    var name: String
    var weight: Int
    var needsCooking: Bool
    var isVegetarian: Bool
    var image: Data
}

extension Ingredient: Hashable {
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.name == rhs.name &&
            lhs.weight == rhs.weight &&
            lhs.needsCooking == rhs.needsCooking &&
            lhs.isVegetarian == rhs.isVegetarian &&
            lhs.image == rhs.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(weight)
        hasher.combine(needsCooking)
        hasher.combine(isVegetarian)
        hasher.combine(image)
    }
}
