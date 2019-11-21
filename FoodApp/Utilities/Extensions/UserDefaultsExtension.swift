//
//  UserDefaultsExtension.swift
//  SpreadsheetApp
//
//  Created by Dmitriy Petrov on 01/11/2019.
//  Copyright © 2019 BytePace. All rights reserved.
//

import Foundation

extension UserDefaults {
    func setStruct<T: Codable>(_ value: T?, forKey defaultName: Constants.CodingPath) {
        let data = try? JSONEncoder().encode(value)
        set(data, forKey: defaultName.rawValue)
    }
    
    func structData<T>(_ type: T.Type, forKey defaultName: Constants.CodingPath) -> T? where T : Decodable {
        guard let encodedData = data(forKey: defaultName.rawValue) else {
            return nil
        }
        
        return try! JSONDecoder().decode(type, from: encodedData)
    }
    
    func setStructArray<T: Codable>(_ value: [T], forKey defaultName: Constants.CodingPath) {
        let data = value.map { try? JSONEncoder().encode($0) }
        
        set(data, forKey: defaultName.rawValue)
    }
    
    func structArrayData<T>(_ type: T.Type, forKey defaultName: Constants.CodingPath) -> [T] where T : Decodable {
        guard let encodedData = array(forKey: defaultName.rawValue) as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(type, from: $0) }
    }
}
