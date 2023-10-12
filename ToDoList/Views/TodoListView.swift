//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel:TodoListViewModel
    @FirestoreQuery var itemsList: [TodoListItem]
    
//    private let userId: String
    init(userId: String){
//        self.userId = userId
        //Users<Uuid>/todos<items>
        self._itemsList = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(UserId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(itemsList) {itemsList in
                    TodoListItemView(item: itemsList)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.deleteItem(itemId: itemsList.id)
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
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
        TodoListView(userId: "q2kV3VbA1Wbw71Km5xCewYZyCW92")
    }
}
