//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Michał Wójcik on 22/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var appCurrentChoice = Int.random(in: 0...2)
    @State private var didPlayerWin = Bool.random()
    @State private var score = 0
    @State private var systemScore = 0

    
    var correctAnswer: Int {
        if appCurrentChoice < 2 {
            return appCurrentChoice + 1
        } else {
            return 0
        }
    }
        
    var moves = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack(spacing: 36) {
                Text("Let's play a game 🎮").font(Font.system(size:21, design: .rounded)).fontWeight(.bold).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 20){
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            print(buttonTapped(number))
                            randomizeAppsChoice()
                        }) {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 300, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).shadow(color: .black, radius: 30, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 15).opacity(0.10)
                                    .foregroundColor(.white)
                                Text(self.moves[number])
                                    .font(Font.system(size:17, design: .rounded))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                Text("My score is: \(systemScore) 😈").foregroundColor(.gray).font(Font.system(size:15, design: .rounded))
                if score > 0 {
                    Text("Your score is: \(score) 😃").foregroundColor(.gray).font(Font.system(size:15, design: .rounded))
                } else {
                    Text("Your score is: \(score) 😔").foregroundColor(.gray).font(Font.system(size:15, design: .rounded))

                }
            }
        }
    }
    func buttonTapped(_ number: Int) {
        if didPlayerWin {
            if number == correctAnswer {
                score += 1
                print("You won")
            } else if number == appCurrentChoice{
                print("It's a tie")
            } else {
                systemScore += 1
                print("You lost")
            }
        }
    }
    
    func randomizeAppsChoice() {
        appCurrentChoice = Int.random(in: 0...2)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
