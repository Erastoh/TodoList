//
//  NewItemsViewModel.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemsViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){
        
    }
    
    func saveItem(){
        guard canSave else{
            return 
        }
        
        //get user Uuid
        guard let uuid = Auth.auth().currentUser?.uid else{
            return
        }
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}

