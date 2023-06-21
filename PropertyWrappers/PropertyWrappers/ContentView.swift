//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Admin on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    
   @State var counter = 0
    
    var body: some View {
        VStack {
            Text("Состояние \(counter)")
            Button("Увеличить состояние") {
                counter += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
