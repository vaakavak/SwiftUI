//
//  ContentView.swift
//  WeSplit
//
//  Created by Admin on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Гарри", "Гермиона", "Рон"]
    @State private var selectedStudents = "Гарри"
    
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Выберите студента", selection: $selectedStudents) {
                    ForEach (students, id: \.self) {
                        Text("\($0)")
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
