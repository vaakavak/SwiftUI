//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Евгений Шилов on 25.09.2023.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locale \(file) in boundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to loade \(file) in boundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) in boundle.")
        }
        
        return loaded
    }
}
