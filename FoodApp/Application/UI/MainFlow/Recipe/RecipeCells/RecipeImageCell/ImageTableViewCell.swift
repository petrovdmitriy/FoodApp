//
//  ImageTableViewCell.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ImageTableViewCell: DisposableTableViewCell, ClassIdentifiable, NibIdentifiable {
    @IBOutlet weak var recipeImage: UIImageView!

    var viewModel: ImageCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        recipeImage.layer.masksToBounds = true
        recipeImage.layer.cornerRadius = 15
        recipeImage.layer.borderWidth = 1
        recipeImage.layer.borderColor = UIColor.darkGray.cgColor
    }
}

extension ImageTableViewCell: BindableType {
    func bindViewModel() {
        viewModel.imageData.map { UIImage(data: $0) }
            .drive(recipeImage.rx.image)
            .disposed(by: disposeBag)
    }
}
