//
//  Roll.swift
//  DiceTheRoll
//
//  Created by Oliwier Kasprzak on 07/04/2023.
//

import Foundation

struct Roll: Codable, Identifiable {
    var id = UUID()
    let diceRoll: Int 
}
