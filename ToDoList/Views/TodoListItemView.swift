//
//  TodoListItemView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodolistItemsViewModel()
    let item: TodoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).bold().font(.title)
                Text("\(Date(timeIntervalSince1970: item.duedate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
            }
            Spacer()
//            Image(systemName: "backward")
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: .init(id: "123", title: "Coding", duedate: Date().timeIntervalSince1970, createAt: Date().timeIntervalSince1970, isDone: true))
    }
}
