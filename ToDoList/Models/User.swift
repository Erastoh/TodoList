//
//  User.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import Foundation

struct User: Codable{
    let id:String
    let name:String
    let email:String
    let joined: TimeInterval
}
