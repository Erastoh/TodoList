//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//
import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
//    init(email: String = "", password: String = "") {
//        self.email = email
//        self.password = password
//    }
    init(){
        
    }
    
    func login(){
        guard validate() else{
            return
        }
        // Try Login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
   private func validate() -> Bool{
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
               !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           errorMessage = "Please Fill All Spaces"
           return false
       }
       
       guard email.contains("@") && email.contains(".")else{
           errorMessage = "Please Enter a Valid Email Address"
           return false
       }
       return true
    
    }
}
