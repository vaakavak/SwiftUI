//
//  ContentView.swift
//  Moonshot
//
//  Created by Евгений Шилов on 11.09.2023.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
        init(_ text: String) {
            print("Creating a new Custotext")
            self.text = text
        }
}

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 30) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
