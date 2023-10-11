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
        print("Reached here--------------------")
        guard canSave else{
            return 
        }
        
        //get user Uuid
        guard let uuid = Auth.auth().currentUser?.uid else{
            return
        }
        print("Reached here-------------after gueard ${uuid}-------")
        //Create Model
        let newUid = UUID().uuidString
        let newItem = TodoListItem(
            id: newUid,
            title: title,
            duedate: dueDate.timeIntervalSince1970,
            createAt: Date().timeIntervalSince1970,
            isDone: false)
        print("Reached here--------------------", newUid)
        //Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uuid)
            .collection("todos")
            .document(newUid)
            .setData(newItem.asDictionary())
        print("Reached here--------------------", db)
    }
    
    var canSave: Bool{
       
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            print("Reached here------------------can save title error--", title ,".....")
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            print("Reached here------------------can save duedate error--")
            return false
        }
        print("Reached here------------------can save true--")
        return true
    }
}

