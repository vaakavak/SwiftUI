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
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25, 30]
    
    var totalPerPerson: Double {                        //Расчитывает общую сумму на одного человека
        let peopleCount = Double(numberOfPeople + 2)    // прводим людей к десятичному значению, и добавляем 2 еденицы, чтобы соответствовать пикеру
        let tipSelection = Double(tipPercentage)        //приводим проценты к десятичному значению
        let tipValue = checkAmount / 100 * tipSelection //рассчитываем проценты
        let grandTotal = checkAmount + tipValue         // общая сумма + чаевые
        let amountPerPerson = grandTotal / peopleCount  //сумма на одного человека
        return amountPerPerson
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Сумма чека", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad) //модификатор тип клавиатуры
                        .focused($amountIsFocused)
                    
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
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) { //ToolbarItemGroup - группа элементов панели инструментов, внутри размещаем нашу кнопку и говорим что кнопка должна быть на клавиатуре
                    Spacer() //сдвигает кнопку к правому краю
                    Button("Done") { //говорим что есть кнопка готова
                        amountIsFocused = false //при нажатии на кнопку нужно закрыть ее, применить значение false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
