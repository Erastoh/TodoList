//
//  ContentView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 23/09/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
