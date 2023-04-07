//
//  ContentView.swift
//  DiceTheRoll
//
//  Created by Oliwier Kasprzak on 07/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var diceNumber = 2
    var body: some View {
        ZStack {
            Color.orange
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
                    var number = Int.random(in: 1..<7)
                    withAnimation {
                        diceNumber = number
                    }
                }
                .padding()
                .background(.cyan)
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
