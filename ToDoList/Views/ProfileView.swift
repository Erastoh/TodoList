//
//  ProfileView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //Avator
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                    .frame(width: 125, height: 125)
                //name
                //email
                //meMber since
                VStack(alignment: .leading){
                    HStack{
                        Text("Name: ")
                        Text("Erastus Moovn")
                    }
                    
                    HStack{
                        Text("Email: ")
                        Text("erastus@gmail.com")
                    }
                    
                    HStack{
                        Text("Member Since: ")
                        Text("14th 10 2023")
                    }
                    
                }
                
                //Sign out
                
                TldButtonView(title: "Log Out", background: .red){
                    
                }
            }.navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
