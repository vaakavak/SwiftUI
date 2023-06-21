//
//  ContentView.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 19.05.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 30) {
            Text(isAuth ? "Авторизация" : "Регистрация")
                .padding(isAuth ? 16 : 20)
                .padding(.horizontal, 40)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(isAuth ? 30 : 60)
            
            VStack{
                TextField("Введите Email", text: $email)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                    
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !isAuth {
                    SecureField("Повторите пароль", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if isAuth {
                        print("авторизация")
                        
                        AuthService.shared.signIn(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                            case .success(_):
                                isTabViewShow.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                                isShowAlert.toggle()
                            }
                        }
                        
                        
                        
                    } else {
                        print("регистрация")
                        
                        guard password == confirmPassword else {
                            self.alertMessage = "Пароли не совпадают!"
                            self.isShowAlert.toggle()
                            return
                        }
                        
                        AuthService.shared.signUp(email: self.email,
                                                  password: self.password) { result in
                            switch result {
                            case .success(let user):
                                alertMessage = "Вы зарегестрировались с email \(user.email!)"
                                self.isShowAlert.toggle()
                                self.email = ""
                                self.password = ""
                                self.confirmPassword = ""
                                self.isAuth.toggle()
                            case .failure(let error):
                                alertMessage = "Ошибка регистрации \(error)"
                                self.isShowAlert.toggle()
                            }
                        }
                        
                        
                       
                    }
                    
                } label: {
                    Text(isAuth ? "Войти" : "Регистрация")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color("darkBrown"))
                }

                
                Button {
                    isAuth.toggle()
                } label: {
                    Text(isAuth ? "Ещё не с нами?" : "Уже есть аккаунт")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color("darkBrown"))
                        
                }
            }
            .padding()
            .padding(.top)
            .background(Color("whiteAlpha"))
            .cornerRadius(20 )
            .padding(isAuth ? 30 : 12)
            .alert(alertMessage, isPresented: $isShowAlert) { //уведомление если не прошла проверка подтверждения пароля
                Button {  } label: {
                    Text("Ok")
                }

            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("bg")
                .ignoresSafeArea()
                .blur(radius: isAuth ? 0 : 6))
            .animation(Animation.easeOut(duration: 0.3), value: isAuth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                
                MainTabBar(viewModel: mainTabBarViewModel) //открываем другую вьюху
            }
            
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
