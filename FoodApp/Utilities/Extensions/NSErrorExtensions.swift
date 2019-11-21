//
//  NSErrorExtensions.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 07/10/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import Foundation

extension NSError {
    static func error(message: Constants.Error) -> NSError {
        return NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message.rawValue])
    }

    static var decodingError = error(message: .decoding)
}
