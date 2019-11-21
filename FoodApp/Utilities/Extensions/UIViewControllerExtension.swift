//
//  UIViewControllerExtension.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 15/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
}
