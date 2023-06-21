//
//  ContentView.swift
//  WeSplit
//
//  Created by Admin on 21.06.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Group{
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            Section {
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
            }
            }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
