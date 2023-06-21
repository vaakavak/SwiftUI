//
//  ProfileViewModel.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 19.06.2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: ESUser
    
    init(profile: ESUser) {
        self.profile = profile
    }
    
    func setProfile() { //сохранем профиль пользователя
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print("Ошибка отправки данных \(error.localizedDescription)")
            }
        }
    }
    
    func getProfile() { //получаем данные пользователя
        
    }
}
