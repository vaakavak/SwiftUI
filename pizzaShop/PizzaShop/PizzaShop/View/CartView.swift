//
//  CartView.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 22.05.2023.
//

import SwiftUI

struct CartView: View {
    
   @StateObject var viewModel: CartViewModel //StateObject наблюдаемое свойство (обновляет постоянно view)
    
    var body: some View {
        VStack {
            List(viewModel.position) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button { //удаление позиции из списка по id продукта
                            viewModel.position.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red) //Делаем кнопку красной

                    }
                
            }
            .listStyle(.plain) //таблица
        .navigationTitle("Корзина")
            
            HStack{
                Text("Итого:")
                    .fontWeight(.bold)
                Spacer()
                Text("\(self.viewModel.cost) ₽")
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack(spacing: 24) {
                Button {
                    print("Отменить")
                } label: {
                    Text("Отменить")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(20)
                }
                Button {
                    print("Заказать")
                } label: {
                    Text("Заказать")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(20)
                }

            }
            .padding()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
