//
//  UIViewExtensions.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 09/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit

extension UIView {
    func dequeueError<T>(withIdentifier reuseIdentifier: String, type _: T) -> String {
        return "Couldn't dequeue \(T.self) with identifier \(reuseIdentifier)"
    }
}
