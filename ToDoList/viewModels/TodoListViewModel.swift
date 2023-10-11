//
//  TodoListViewModel.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//
import FirebaseFirestore
import Foundation
// Model for sinqle items
class TodoListViewModel: ObservableObject{
    @Published var isShowingNewItemView = false
    private let UserId: String
    init(UserId:String){
        self.UserId = UserId
    }
    
    /// Deleting a record.
    /// - Parameter itemId: Item Id to delete
    func deleteItem(itemId: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(UserId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
