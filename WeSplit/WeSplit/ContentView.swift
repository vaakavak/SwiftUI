//
//  ContentView.swift
//  WeSplit
//
//  Created by Admin on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private  var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [0, 5, 10, 15, 20, 25, 30]
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Сумма чека", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    Picker("Количество людей", selection: $numberOfPeople) {
                        ForEach (2..<100) {
                            Text("\($0)  человек")
                        }
                    }
                }
                Section {
                    Picker("Кол-во чаевых в %", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text(($0), format: .percent) //percent - преобразуем в проценты
                        }
                    }
                    .pickerStyle(.segmented)
                }
            header: {
                    Text("Выберите процент чевых")
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
