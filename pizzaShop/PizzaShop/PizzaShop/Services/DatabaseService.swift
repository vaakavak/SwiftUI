//
//  DatabaseService.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 15.06.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService() //подключили экзепляр класса DatabaseService
    
    private var db = Firestore.firestore()  //обращение через db к базе данных на сервере
    
    private var usersRef: CollectionReference { //ссылка по которой мы обращаемся к коллекции пользователей
        return db.collection("users")
    }
    
    private init() { } //сделали клас приватным, чтобы никто не прикручивал доп базы
    
    func setProfile(user: ESUser, completion: @escaping (Result<ESUser, Error>) -> ()) { //создание пользователя в базе данных
     
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
        
    }
    
    func getProfile(completion: @escaping (Result<ESUser, Error>) -> ()) {
        
        usersRef.document(AuthService.shared.currentUser?.uid).getDocument { docSnapshot, error in
            
            
        }
        
    }
    
}
