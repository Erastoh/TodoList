//
//  ContentView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 23/09/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainviewModel = MainViewModel()
    var body: some View {
        if mainviewModel.isSignedIn, !mainviewModel.currentUserUuid.isEmpty{
            TabView{
                TodoListView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            
        }else{
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
