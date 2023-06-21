//
//  CatalogView.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 22.05.2023.
//

import SwiftUI

struct CatalogView: View {
    
    let layuot = [GridItem(.adaptive(minimum: screen.width / 2.4))] // минимальный размер сетки
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            Section("Популярное") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layuot, spacing: 12) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            NavigationLink {
                                
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding()
                }
            }
            
            Section("Пицца") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layuot, spacing: 12) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) { item in
                            
                            NavigationLink {
                                let viewModel = ProductDetailViewModel(product: item)
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }
                            
                            
                        }
                    }
                    .padding()
                }
            }
            
        }.navigationBarHidden(true)
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
