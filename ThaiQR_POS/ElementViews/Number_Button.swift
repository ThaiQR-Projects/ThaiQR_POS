//
//  Number_Button.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/13/23.
//

import SwiftUI

struct Number_Button: View {
    @State var aText:String
    @State var isTap = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(isTap ? 0.2 : 0.3)
            
            if(aText=="del"){
                Text(Image(systemName: "delete.left")).font(.largeTitle).opacity(isTap ? 0.6 : 1)
            }
            else{
                Text(aText).font(.largeTitle).opacity(isTap ? 0.6 : 1)
            }
            
        }.frame(width: 70,height: 70)
            .onTapGesture {
            print("Hi")
            isTap = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { isTap = false }
        }
        
    }
}

struct Number_Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HStack{
                Number_Button(aText:"1")
                Number_Button(aText:"2")
                Number_Button(aText:"3")
            }
            HStack{
                Number_Button(aText:"4")
                Number_Button(aText:"5")
                Number_Button(aText:"6")
            }
            HStack{
                Number_Button(aText:"7")
                Number_Button(aText:"8")
                Number_Button(aText:"9")
            }
            HStack{
                Number_Button(aText:".")
                Number_Button(aText:"0")
                Number_Button(aText:"del")
            }
        }
        
    }
}
