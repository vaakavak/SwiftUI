//
//  ProductDetailView.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 24.05.2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var size = "Маленькая"
    @State var count = 1
    
    @Environment(\.presentationMode) var presentationMode  //для закрытия экрана
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image("pizzaPh")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 260)
                HStack{
                    Text("\(viewModel.product.title)!")
                        .font(.title2.bold())
                    Spacer()
                    Text("\(viewModel.getPrice(size: self.size)) ₽")
                        .font(.title2)
                }.padding(.horizontal)
                Text("\(viewModel.product.descript)")
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                
                HStack {
                    Stepper("Количество", value: $count, in: 1...10)
                    Text("\(self.count) ")
                        .padding(.leading, 32)
                }.padding(.horizontal)
                
                Picker("Размер пиццы", selection: $size) {
                    ForEach(viewModel.sizes, id:\.self) { item in //каждый из элементов массива
                        Text(item) //запихиваем в текст
                    }
                }.pickerStyle(.segmented)
                    .padding()
            }
            
            Button {
                var position = Position(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                position.product.price = viewModel.getPrice(size: size) //обновляем ценник относительно выбранного размера пиццы
                
                CartViewModel.shared.addPosition(position)
                
                presentationMode.wrappedValue.dismiss() //закрытие экрана
            } label: {
                Text("В корзину")
            }
            .foregroundColor(Color("darkBrown"))
            .font(.title3.bold())
            .padding()
            .padding(.horizontal, 60)
            .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(30)
            
            Spacer()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: Product(id: "1",
                                                                             title: "Маргарита Гурмэ",
                                                                             imageUrl: "Non Found",
                                                                             price: 458,
                                                                             descript: "Дешевая пицца")))
    }
}
