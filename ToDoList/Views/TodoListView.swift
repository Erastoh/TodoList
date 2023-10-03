//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        VStack{
            HeaderView(title: "Home Page", subtitle: "Get Things Done", angle: 15, background: .pink)
        }
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
