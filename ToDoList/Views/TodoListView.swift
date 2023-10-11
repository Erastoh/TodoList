//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewModel()
    private let userId: String
    init(userId: String){
        self.userId = userId
    }
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.isShowingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.isShowingNewItemView){
              
                NewItemView(
                    newItemPresented: $viewModel.isShowingNewItemView
                )
            }
        }
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "")
    }
}
