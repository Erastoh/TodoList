//
//  RegisterView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            //header
            HeaderView(title: "Register", subtitle: "Start Organizing todos", angle: -15, background: .orange)
            
            //login Form
            Form{
                TextField("Name", text:$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Email Address", text:$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text:$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    //attempt to Login in
                }
            label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue)
                    Text("Log In").bold().foregroundColor(Color.white)
                    
                }
            }
            }
            
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
