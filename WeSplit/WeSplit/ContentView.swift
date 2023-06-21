//
//  ContentView.swift
//  WeSplit
//
//  Created by Admin on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var count = 0
    
    var body: some View {
        Text("Вы нажали \(count) раз")
        Button("ТЫк"){
            count += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
