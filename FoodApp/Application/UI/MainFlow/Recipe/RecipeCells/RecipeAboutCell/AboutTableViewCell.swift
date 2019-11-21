//
//  AboutTableViewCell.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AboutTableViewCell: DisposableTableViewCell, ClassIdentifiable, NibIdentifiable {
    @IBOutlet weak var aboutLabel: UILabel!

    var viewModel: AboutCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}

extension AboutTableViewCell: BindableType {
    func bindViewModel() {
        viewModel.text
            .drive(aboutLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
