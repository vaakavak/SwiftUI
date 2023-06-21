//
//  ChildView.swift
//  PropertyWrappers
//
//  Created by Admin on 21.06.2023.
//

import SwiftUI

struct ChildView: View {
    
    @Binding var counter: Int
    
    var body: some View {
        VStack {
            Text("Состояние \(counter)")
            Button("Увеличить состояние") {
                counter += 1
            }
        }
    }
}

//struct ChildView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildView()
//    }
//}
