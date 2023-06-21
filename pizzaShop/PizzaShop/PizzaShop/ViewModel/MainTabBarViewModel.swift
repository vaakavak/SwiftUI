//
//  MainTabBarViewModel.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 14.06.2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
