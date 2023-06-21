//
//  Position.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 02.06.2023.
//
// Отличается от продукта, тем что еще и количество содержит

import Foundation

struct Position: Identifiable {
    
    var id: String
    var product: Product
    var count: Int
    
    var cost: Int {
        return product.price * self.count  //высчитываем стоимость в корзине
    }
    
}
