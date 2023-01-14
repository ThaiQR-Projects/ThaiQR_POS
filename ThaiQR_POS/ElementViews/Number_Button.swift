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
    var completion: (String) -> Void
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
            isTap = true
            completion(aText)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { isTap = false }
        }
        
    }
    
    init(aText: String, isTap: Bool = false, completion: @escaping (String) -> Void) {
        self.aText = aText
        self.isTap = isTap
        self.completion = completion
    }
}

struct Number_Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            HStack{
                Number_Button(aText:"1", completion: {print($0)})
                Number_Button(aText:"2", completion: {print($0)})
                Number_Button(aText:"3", completion: {print($0)})
            }
            HStack{
                Number_Button(aText:"4", completion: {print($0)})
                Number_Button(aText:"5", completion: {print($0)})
                Number_Button(aText:"6", completion: {print($0)})
            }
            HStack{
                Number_Button(aText:"7", completion: {print($0)})
                Number_Button(aText:"8", completion: {print($0)})
                Number_Button(aText:"9", completion: {print($0)})
            }
            HStack{
                Number_Button(aText:".", completion: {print($0)})
                Number_Button(aText:"0", completion: {print($0)})
                Number_Button(aText:"del", completion: {print($0)})
            }
        }
        
    }
}
