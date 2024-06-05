//
//  MockDataProvider.swift
//  Benchtime
//
//  Created by Tosun, Irem on 5.06.2024.
//

import Foundation

struct MockDataProvider {
    static func load<T: Decodable>(resourceName: String) -> T {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource \(resourceName) does not exist")
        }
        let data = try! Data(contentsOf: URL(filePath: path))
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
