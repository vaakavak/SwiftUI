//
//  ContentView.swift
//  Moonshot
//
//  Created by Евгений Шилов on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
       
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text("\(astronauts.count)") //словарь успешно загружен
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
