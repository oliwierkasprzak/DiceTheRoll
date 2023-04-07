//
//  ContentView.swift
//  DiceTheRoll
//
//  Created by Oliwier Kasprzak on 07/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var dices = [Roll]()
    @State private var diceNumber = 2
    @State private var isShowingHistory = false
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0, green: 0, blue: 0.5), location: 0.3),
                    .init(color: Color(red: 1, green: 0.84, blue: 0), location: 0.9),
                    .init(color: Color(red: 0, green: 0.39, blue: 0.4), location: 1.01)
                ], center: .bottomLeading, startRadius: 30, endRadius: 700)
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Roll me!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    ZStack {
                        Rectangle()
                            .fill(.red)
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        
                        Text(String(diceNumber))
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    Button("ROLL") {
                        let number = Int.random(in: 1..<7)
                        withAnimation {
                            diceNumber = number
                        }
                        let dice = Roll(diceRoll: diceNumber)
                        dices.append(dice)
                        save()
                    }
                    .padding()
                    .background(Color(CGColor(red: 0.9, green: 0.3, blue: 0.4, alpha: 1)))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    
                    Spacer()
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingHistory = true
                    } label: {
                        Label("Previous", systemImage: "folder.fill.badge.person.crop")
                            .foregroundColor(Color(red: 1, green: 0.84, blue: 0.7))
        
                    }
                }
            }
            .sheet(isPresented: $isShowingHistory) {
                RollHistory(dices: dices)
            }
        }
    }
    func save() {
        let url = getDocumentsDirectory().appendingPathComponent("roll.json")
        if let data = try? JSONEncoder().encode(dices) {
            try? data.write(to: url)
        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
