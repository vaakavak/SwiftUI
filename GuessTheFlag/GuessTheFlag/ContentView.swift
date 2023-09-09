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
    
    @State private var totalScore = 0
    @State private var isFinishGame = false    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack (spacing: 40) {
                Text("Угадайте флаг")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack {
                    VStack  {
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
                Text("Счет: \(totalScore)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
        }
        //правильно ответили
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Продолжить", action: askQuestion)
        } message: {
            Text("Ваш счет \(totalScore)")
        }
        //вы выиграли
        .alert("Вы выиграли", isPresented: $isFinishGame) {
            Button("Новая игра", action: reset)
        } message: {
            Text("Вы отгадали все флаги")
        }
    }
    func flagTapped (_ number: Int) {
        if totalScore > 0 {
            if number == correctAnswer {
                scoreTitle = "Верно"
                totalScore += 1
            } else {
                    scoreTitle = "Неправильно, это флаг \(countries[correctAnswer])"
                totalScore -= 1
                }
        } else if totalScore == 0 {
            if number == correctAnswer {
                scoreTitle = "Верно"
                totalScore += 1
            } else {
                    scoreTitle = "Неправильно, это флаг \(countries[correctAnswer])"
                totalScore -= 1
                }
        } // else if totalScore > 8 {
//            if number == correctAnswer {
//                scoreTitle = "Верно, вы прошли всю игру"
//                newGame()
//            } else {
//                print("PPPPPPP")
//            }
        else {
            scoreTitle = "Неправильно, это флаг \(countries[correctAnswer]). Игра окончена!!!"
            newGame()
        }
        showingScore.toggle()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func newGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        correctAnswer = 0
        totalScore = 0
    }
    
    func checkNegativScore() {
        if totalScore <= 0 {
            newGame()
        } else {
            totalScore -= 1
        }
    }
    
    func reset() {
        if totalScore >= 8 {
            newGame()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
