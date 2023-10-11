//
//  TodoListItem.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import Foundation


struct TodoListItem: Codable, Identifiable{
    let id:String
    let title: String
    let duedate: TimeInterval
    let createAt: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}
