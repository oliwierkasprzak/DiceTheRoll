//
//  RollHistory.swift
//  DiceTheRoll
//
//  Created by Oliwier Kasprzak on 07/04/2023.
//

import SwiftUI

struct RollHistory: View {
    @State var dices = DataManager.loadData()
    var body: some View {
        List {
            ForEach(dices.reversed()) { dice in
                Text("You rolled \(dice.diceRoll)!")
            }
        }
    }
}


