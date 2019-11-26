//
//  ClassIdentifiable.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 09/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import UIKit

protocol ClassIdentifiable: class {
    static var reuseId: String { get }
}

extension ClassIdentifiable {
    static var reuseId: String {
        return String(describing: self)
    }
}
