//
//  RecipeDataSource.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxDataSources
import UIKit

enum RecipeSectionModel {
    case recipe(items: [SectionItem])
}

enum SectionItem {
    case image(imageData: Data)
    case about(text: String)
    case ingredients(ingredients: [Ingredient])
}

extension RecipeSectionModel: SectionModelType {
    typealias Item = SectionItem

    var items: [SectionItem] {
        switch self {
        case .recipe(let items):
            return items.map { $0 }
        }
    }

    init(original: RecipeSectionModel, items: [Item]) {
        switch original {
        case .recipe:
            self = .recipe(items: items)
        }
    }
}
