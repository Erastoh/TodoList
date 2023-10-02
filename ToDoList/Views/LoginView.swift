//
//  LoginView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct LoginView: View {
   @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .pink)
                
                //login Form
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                
                    }
                    TextField("Email Address", text:$viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text:$viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    TldButtonView(title: "Log In", background: .blue){
                        //login Attempt
                        viewModel.login()
                    }.padding()
                }.offset(y:-50)
                
                //Registration Button
                VStack{
                    Text("New around here?")
                
                    NavigationLink("Create Account",
                                   destination: RegisterView())
                }.padding(.bottom, 50
                )
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
