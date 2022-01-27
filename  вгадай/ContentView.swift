//
//  ContentView.swift
//   вгадай
//
//  Created by Nazar Babyak on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var flowers = ["Piano Rose", "Wedding Piano", "Charming Piano" , "Frilend Piano", "Bridal Piano" , "Arabian Night" , "Bristol Stripe" , "Playa Blanca"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray , .white]), startPoint: .top, endPoint: .bottom )
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 14) {
                VStack {
                    Text("Виберіть квітку:")
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(5)
                        .frame(maxWidth: .infinity, maxHeight: 55)
                        .background(Color(red: 254.0, green: 123.0, blue: 13.0))
                        .cornerRadius(11)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                    Text(flowers[correctAnswer])
                        .foregroundColor(.black)
                        .font(.title)
                        .padding(5)
                        .frame(maxWidth: .infinity, maxHeight: 55)
                        .background(Color(red: 254.0, green: 123.0, blue: 13.0))
                        .cornerRadius(11)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                }
                ForEach(0..<3) {
                    number in Button (action: {
                        self.flowerTapped(number)
                        self.showingScore = true
                    
                    })
                    {
                        Image(self.flowers[number])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 150)
                            .cornerRadius(5)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 5, y: 5)
                    }
                }
                Text("Загальний рахунок: \(score)")
                    .foregroundColor(.black)
                    .font(.title)
                    .padding(5)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(Color(red: 254.0, green: 123.0, blue: 13.0))
                    .cornerRadius(11)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 3, y: 3)
                
                Spacer ( )
            }
        } .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle),
                  message: Text("Загальний рахунок \(score)"),
                  dismissButton: .default(Text("Продовжити")){
                askQuestion()
            }
            )
            
        }
    }
    func askQuestion() {
        flowers.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func flowerTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Правильна відповідь"
            score += 1
        }
        else {
            scoreTitle = "Неправильна відповідь \(flowers[number])"
            score -= 1
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
