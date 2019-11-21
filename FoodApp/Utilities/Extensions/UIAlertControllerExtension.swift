//
//  UIAlertControllerExtension.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 08/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func showError(title: String? = nil, error: Error) {
        guard (error as NSError).code != 100 else { return } //Skip connection was lost error

        let alertController = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
