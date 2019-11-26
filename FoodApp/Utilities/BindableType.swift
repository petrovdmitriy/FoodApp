//
//  BindableType.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 09/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit

/**

 Each view controller conforming to the BindableType protocol
 will declare a ViewModelType variable and provide a bindViewModel() function
 to be called once the viewModel variable is assigned.
 This function will connect UI elements to observables and actions in the view model.

 */

protocol BindableType {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}

extension BindableType where Self: UIView {
    mutating func bind(to viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        bindViewModel()
    }
}
