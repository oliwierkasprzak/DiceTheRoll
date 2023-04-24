//
//  DataManager.swift
//  DiceTheRoll
//
//  Created by Oliwier Kasprzak on 24/04/2023.
//

import Foundation

struct DataManager {
    static var savedURL = FileManager.getDocumentsDirectory.appendingPathComponent("savedDices")
    
    static func loadData() -> [Roll] {
        if let data = try? Data(contentsOf: savedURL) {
            if let decoed = try? JSONDecoder().decode([Roll].self, from: data) {
                return decoed
            }
        }
        
        return []
    }
    
    static func saveData(_ rolls: [Roll]) {
        if let encoded = try? JSONEncoder().encode(rolls) {
            try? encoded.write(to: savedURL, options: [.atomic, .completeFileProtection])
        }
    }
}
