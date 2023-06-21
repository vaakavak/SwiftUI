//
//  MainTabBar.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 22.05.2023.
//

import SwiftUI

struct MainTabBar: View {
    
    var viewModel: MainTabBarViewModel
    
    var body: some View {
        
        TabView{
            NavigationView{
                CatalogView()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "menucard")
                        Text("Каталог")
                    }
                }
            
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack{
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
            
            ProfileView(viewModel: ProfileViewModel(profile: ESUser(id: "",
                                                                    name: "",
                                                                    phone: 0000000000,
                                                                    adress: "")))
                .tabItem {
                    VStack{
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
            
        }
    }
}

//struct MainTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBar(viewModel: <#MainTabBarViewModel#>)
//    }
//}
