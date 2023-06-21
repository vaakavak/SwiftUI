//
//  AuthService.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 13.06.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private init() { }
    
    private let auth = Auth.auth() //доступ к таблице с пользаками на файрбейсе
    
     var currentUser: User? {
        return auth.currentUser
    }
    
    func signUp (email: String,      //метод создания пользователя
                 password: String,
                 completion: @escaping(Result<User, Error>) -> ()) {
        
        auth.createUser(withEmail: email, password: password) { result, error in
            if let result = result {
                
                let esUser = ESUser(id: result.user.uid,
                                    name: "",
                                    phone: 0,
                                    adress: "")
                
                DatabaseService.shared.setProfile(user: esUser) { resultDB in
                    switch resultDB {     
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
                
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
    func signIn (email: String,      //метод авторизации пользователя
                 password: String,
                 completion: @escaping(Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
}
