//
//  HeaderView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 01/10/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0).foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: 15))
                .offset(y: -80)
            
            VStack{
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text("Get Things Done")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            
            }
//            .padding(.top, 20)
        }.frame(width: UIScreen.main.bounds.width * 3,
                height: 300)
            .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
