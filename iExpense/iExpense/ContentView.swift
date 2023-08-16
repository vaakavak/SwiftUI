//
//  ContentView.swift
//  iExpense
//
//  Created by Admin on 16.08.2023.
//

import SwiftUI

class User: ObservedObject {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
