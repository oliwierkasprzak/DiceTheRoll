//
//  RollHistory.swift
//  DiceTheRoll
//
//  Created by Oliwier Kasprzak on 07/04/2023.
//

import SwiftUI

struct RollHistory: View {
    @State var dices: [Roll]
    var body: some View {
        List {
            ForEach(dices.reversed()) { dice in
                Text("You rolled \(dice.diceRoll)!")
            }
        }
        .onAppear(perform: loadData)
    }
    
     func loadData() {
        let url = getDocumentsDirectory().appendingPathComponent("roll.json")
        let data = try? Data(contentsOf: url)
        if let decoder = try? JSONDecoder().decode([Roll].self, from: data ?? Data([])) {
            dices = decoder
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}


