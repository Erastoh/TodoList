//
//  TldButtonView.swift
//  ToDoList
//
//  Created by Erastus Mugambi on 02/10/2023.
//

import SwiftUI

struct TldButtonView: View {
    let title: String
    let background:Color
    let action:() -> Void
    var body: some View {
        Button {
            //Action
            action()
        }
        label: {
        ZStack{
            RoundedRectangle(cornerRadius: 10).foregroundColor(background)
            Text(title).bold().foregroundColor(Color.white)
            
        }
    }
    }
}

struct TldButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TldButtonView(title: "Title", background: .pink){
            
        }
    }
}
