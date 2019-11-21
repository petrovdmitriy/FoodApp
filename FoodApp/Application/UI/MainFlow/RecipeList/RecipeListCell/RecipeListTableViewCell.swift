//
//  RecipeListTableViewCell.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 20/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RecipeListTableViewCell: DisposableTableViewCell, ClassIdentifiable, NibIdentifiable {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var isVegetarianLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!

    var viewModel: RecipeListCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        recipeImage.layer.masksToBounds = true
        recipeImage.layer.cornerRadius = 10
    }
}

extension RecipeListTableViewCell: BindableType {
    func bindViewModel() {
        viewModel.name
            .drive(nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.calories
            .drive(caloriesLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.isVegetarian
            .map {
                if $0 {
                    return "Vegetarian"
                } else {
                    return "Non-Vegetarian"
                }
            }
            .drive(isVegetarianLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.imageData.map { UIImage(data: $0) }
            .drive(recipeImage.rx.image)
            .disposed(by: disposeBag)
    }
}
