//
//  ProductCell.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 23.05.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        VStack(spacing: 2) {
            Image("pizzaPh")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45) //задаем параметры для обрезки
                .clipped() //обрезаем
            HStack{
                Text(product.title)
                    .font(.custom("AvenierNext-regular", size: 14))
                    Spacer()
                Text("\(product.price)₽")
                    .font(.custom("AvenierNext-bold", size: 14))
            }
            .padding(.horizontal, 4)
            .padding(.bottom, 5)
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.55)
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 14)
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "Маргарита Гурмэ",
                                     imageUrl: "Non Found",
                                     price: 458,
                                     descript: "Дешевая пицца"))
    }
}
