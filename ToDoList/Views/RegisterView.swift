//
//  RegisterView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerView = RegisterViewModel()
    var body: some View {
        VStack{
            //header
            HeaderView(title: "Register", subtitle: "Start Organizing todos", angle: -15, background: .orange)
            
            //login Form
            Form{
                TextField("Full Name", text:$registerView.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text:$registerView.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text:$registerView.password)
                    .textFieldStyle(DefaultTextFieldStyle())
//                Button {
//                    //attempt to Login in
//                }
//            label: {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
//                    Text("Create Account").bold().foregroundColor(Color.white)
//
//                }
//            }
                TldButtonView(title: "Create Account", background: .green){
                    // Attempt Registration
                }.padding()
            }.offset(y: -50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
