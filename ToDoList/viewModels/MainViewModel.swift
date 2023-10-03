//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//
import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject{
    @Published var currentUserUuid:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] __, user in
            DispatchQueue.main.async{
                self?.currentUserUuid = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
