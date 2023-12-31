//
//  PositionCell.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 05.06.2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            Text(position.product.title)
                .fontWeight(.bold)
            Spacer()
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽")
                .frame(width: 85, alignment: .trailing)
        }
        .padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString, product: Product(id: UUID().uuidString, title: "Маргарита ГурмЭ", imageUrl: "pizzaPh", price: 580, descript: "NA/na NA/na NA/na NA/na NA/na NA/na v NA/na"), count: 3))
    }
}
