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
        NavigationView {
            NavigationLink("Click",
                           destination: ChildView(counter: $counter))
            .padding()
            .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
