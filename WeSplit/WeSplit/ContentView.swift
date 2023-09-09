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
    
    var amountOfTheCheck: Double {                      //Расчитывает общую сумму чека
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Сумма чека", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad) //модификатор типa клавиатуры
                        .focused($amountIsFocused)
                    
                    Picker("Количество людей", selection: $numberOfPeople) {
                        ForEach (2..<100) {
                            Text("\($0)  человек")
                        }
                    }
                }
                Section {
                    Picker("Кол-во чаевых в %", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text(($0), format: .percent) //percent - преобразуем в проценты
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            header: {
                    Text("Выберите процент чевых")
                }
                Section {
                    Text(amountOfTheCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
                
            header: {
             Text("Общая сумма чека")
            }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            header: {
                Text("Сумма на человека")
            }
            }
            .navigationTitle("WeSplit")
            .toolbar { //Модификатор позволяет указывать элементы панели инструментов для представления.
                ToolbarItemGroup(placement: .keyboard) { //ToolbarItemGroup - позволяет нам разместить одну или несколько кнопок в определенном месте. placement: .keyboard - указываем, что нам нужна панель инструментов keyboard – панель инструментов, которая прикреплена к клавиатуре.
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
