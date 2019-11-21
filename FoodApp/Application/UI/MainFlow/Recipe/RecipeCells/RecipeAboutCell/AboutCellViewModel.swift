//
//  AboutCellViewModel.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class AboutCellViewModel: DisposableViewModel {
    var text: Driver<String>
    
    init(withText text: String) {
        self.text = Driver.just(text)
    }
}
