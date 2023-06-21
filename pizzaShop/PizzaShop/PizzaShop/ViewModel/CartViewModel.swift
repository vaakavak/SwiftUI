//
//  CartViewModel.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 02.06.2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    static let shared = CartViewModel()
    
    private init() { }
    
    @Published var position = [Position]()
    
    var cost: Int {//Стоимость всей корзины
        
        var sum = 0
        
        for pos in position {
            sum += pos.cost
        }
        return sum
    }
    
    func addPosition (_ position: Position) {
        self.position.append(position)
    }
}
