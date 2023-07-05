//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Admin on 28.06.2023.
//

import SwiftUI

struct ContentView: View {
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var scoreTitle = ""
    @State private var showingScore = false
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack (spacing: 45) {
                Text("Угадайте флаг")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack {
                    VStack {
                        Spacer()
                        Text("Выберите правильный флаг")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.bold))
                            
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach (0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .cornerRadius(15)
                            .shadow(radius: 5)                    }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Счет: ???")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Продолжить", action: askQuestion)
        } message: {
            Text("Ваш счет ???")
        }
        }
    func flagTapped (_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Верно"
        } else {
            scoreTitle = "Неправильно"
        }
        showingScore.toggle()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
