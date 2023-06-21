//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 24.05.2023.
//

import Foundation

class CatalogViewModel: ObservableObject { //ObservableObject - объект за которым можно вести наблюдение, все viewModel рекомендуют подписывать под этот протокол
    
    static let shared = CatalogViewModel()
    
    var popularProducts = [
        Product(id: "1",
                title: "Маргарита Гурмэ",
                imageUrl: "Non Found",
                price: 558,
                descript: "Дешевая пицца"),
        Product(id: "2",
                title: "Маргарита",
                imageUrl: "Non Found",
                price: 508,
                descript: "Дешевая пицца"),
        Product(id: "3",
                title: "Пепперони",
                imageUrl: "Non Found",
                price: 490,
                descript: "Дешевая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Non Found",
                price: 600,
                descript: "Дешевая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Non Found",
                price: 650,
                descript: "Дешевая пицца")
    ]
    
    var pizzas = [
        Product(id: "1",
                title: "Маргарита Гурмэ",
                imageUrl: "Non Found",
                price: 558,
                descript: "Дешевая пицца"),
        Product(id: "2",
                title: "Маргарита",
                imageUrl: "Non Found",
                price: 508,
                descript: "Дешевая пицца"),
        Product(id: "3",
                title: "Пепперони",
                imageUrl: "Non Found",
                price: 490,
                descript: "Дешевая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Non Found",
                price: 600,
                descript: "Дешевая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Non Found",
                price: 650,
                descript: "Дешевая пицца")
    ]
    
}
