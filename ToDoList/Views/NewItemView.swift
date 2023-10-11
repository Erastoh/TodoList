//
//  NewItemView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemsViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
//
        VStack{
            
            Button{
                newItemPresented = false
            }label: {
                Image(systemName: "backward")
            }.padding()
            
            Text("New Item").font(.system(size: 32)).bold().padding(.top, 80)
               
            Form{
                
                TextField("Title", text: $viewModel.title ).textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                
                TldButtonView(title: "Submit", background: .green)
                  {
                    if viewModel.canSave{
                        print("Reached here------------------clicked--")
                        viewModel.saveItem()
                        newItemPresented = false
                    }else{
                        print("Reached here------------------cant show--")
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
            newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        })
        )
    }
}
