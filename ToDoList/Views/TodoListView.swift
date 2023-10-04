//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    
                }label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
