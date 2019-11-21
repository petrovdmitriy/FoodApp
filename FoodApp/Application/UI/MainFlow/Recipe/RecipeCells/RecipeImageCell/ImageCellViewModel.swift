//
//  ImageCellViewModel.swift
//  FoodApp
//
//  Created by Dmitriy Petrov on 21/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class ImageCellViewModel: DisposableViewModel {
    var imageData: Driver<Data>
    
    init(withData data: Data) {
        imageData = Driver.just(data)
    }
}
