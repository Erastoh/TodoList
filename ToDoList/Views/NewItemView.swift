//
//  NewItemView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct NewItemView: View {
    var body: some View {
        @StateObject var viewModel = NewItemsViewModel()
//        @Binding var newItemPresented: Bool
        VStack{
            Text("New Item").font(.system(size: 32)).bold().padding(.top, 100)
            
            Form{
                //Title
                TextField("Title", text: $viewModel.title ).textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                //Button
                
                TldButtonView(title: "Submit", background: .green)
                  {
                    if viewModel.canSave{
                        viewModel.saveItem()
    //                    newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                }.padding()
            }.alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please Fill all the Fields and ensure you selected Due date greater than now"))
            }
            
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(
//            newItemPresented: Binding(get: {
//            return true
//        }, set: { _ in
//        })
        )
    }
}
