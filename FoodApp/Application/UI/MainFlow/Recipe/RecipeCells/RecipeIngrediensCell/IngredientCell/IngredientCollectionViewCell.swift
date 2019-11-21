//
//  IngredientCollectionViewCell.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class IngredientCollectionViewCell: DisposableCollectionViewCell, ClassIdentifiable, NibIdentifiable {
    @IBOutlet weak var ingredientImage: UIImageView!
    
    var viewModel: IngredientCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ingredientImage.layer.masksToBounds = true
        ingredientImage.layer.cornerRadius = 5
        ingredientImage.layer.borderWidth = 1
        ingredientImage.layer.borderColor = UIColor.darkGray.cgColor
    }
}

extension IngredientCollectionViewCell: BindableType {
    func bindViewModel() {
        viewModel.imageData.map { UIImage(data: $0) }
            .drive(ingredientImage.rx.image)
            .disposed(by: disposeBag)
    }
}
