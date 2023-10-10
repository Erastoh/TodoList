//
//  NewItemsViewModel.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import Foundation

class NewItemsViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    init(){
        
    }
    
    func saveItem(){
        
    }
}

