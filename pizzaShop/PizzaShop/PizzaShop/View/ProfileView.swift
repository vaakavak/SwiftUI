//
//  ProfileView.swift
//  PizzaShop
//
//  Created by Евгений Шилов on 22.05.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 12) {
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Откуда взять фотку?", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("library")
                        } label: {
                            Text("Из галлереии")
                        }
                        Button {
                            print("Camera")
                        } label: {
                            Text("С камеры")
                        }
                        
                    }
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                    HStack {
                        Text("+7")
                        TextField("Телефон", value: $viewModel.profile.phone, format: .number)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Адресс доставки:")
                    .bold()
                TextField("Адресс", text: $viewModel.profile.adress)
            }.padding(.horizontal)
            
            //Таблица с заказами
            List{
                Text("Здесь будут заказы!!!")
            }
            .listStyle(.plain) //прозрачный стиль
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal, 20)
                    .foregroundColor(Color.black)
                    .padding(.horizontal)
                    .background(Color.red)
                    .cornerRadius(30)
            }.padding()
                .confirmationDialog("Вы уверены, что хотите выйте?", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }
                    
                }
            
                
                .fullScreenCover(isPresented: $isAuthViewPresented) {
                    AuthView()
                }
        }
        .onSubmit {
            viewModel.setProfile()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: ESUser(id: "",
                                                                name: "Вася пирожков",
                                                                phone: 89171784562,
                                                                adress: "Какой-то адресс")))
    }
}
