//
//  RegisterViewModel.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func createAccount(){
        guard Validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){
            // to prevent memory leak
            [weak self]
            result, error in
            guard let userId = result?.user.uid else{
                return
            }
          self?.addUserToDatabase(id: userId)
        }
    }
    
    private func addUserToDatabase(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func Validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
           !email.trimmingCharacters(in: .whitespaces).isEmpty,
           !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please Fill All Spaces"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Enter Valid Email"
            return false
        }
        
        guard password.count > 6 else{
            errorMessage = "Password Should Contain 6 char or more"
            return false
        }
        
        return true
    }
}
