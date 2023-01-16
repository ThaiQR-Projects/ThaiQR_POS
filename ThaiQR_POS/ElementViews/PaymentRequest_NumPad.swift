//
//  PaymentRequest_NumPad.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/13/23.
//

import SwiftUI

struct PaymentRequest_NumPad: View {
    var completion: (String) -> Void //Fuction injections
    @Binding var isAllowDot:Bool
    @Binding var isAllowDel:Bool
    @State var isLarge:Bool
    var body: some View {
        VStack{
            HStack{
                Number_Button(aText:"1", isLarge: isLarge, completion: completion)
                Number_Button(aText:"2", isLarge: isLarge,completion: completion)
                Number_Button(aText:"3", isLarge: isLarge,completion: completion)
            }
            HStack{
                Number_Button(aText:"4", isLarge: isLarge,completion: completion)
                Number_Button(aText:"5", isLarge: isLarge,completion: completion)
                Number_Button(aText:"6", isLarge: isLarge,completion: completion)
            }
            HStack{
                Number_Button(aText:"7", isLarge: isLarge,completion: completion)
                Number_Button(aText:"8", isLarge: isLarge,completion: completion)
                Number_Button(aText:"9", isLarge: isLarge,completion: completion)
            }
            HStack{
                Number_Button(aText:".", isLarge: isLarge,completion: completion).opacity(isAllowDot ? 1:0.5).disabled(!isAllowDot)
                Number_Button(aText:"0", isLarge: isLarge,completion: completion)
                Number_Button(aText:"del", isLarge: isLarge,completion: completion).opacity(isAllowDel ? 1:0.5).disabled(!isAllowDel)
            }
        }
        
        
//        Text("Hollow").onAppear(perform: {
//            completion("aaa")
//        })
    }
    public init(completion: @escaping (String) -> Void, isAllowDot:Binding<Bool>, isAllowDel:Binding<Bool>, isLarge: Bool=false) {
        self.completion = completion
        self._isAllowDot = isAllowDot
        self._isAllowDel = isAllowDel
        self.isLarge = isLarge
    }
}

struct PaymentRequest_NumPad_Previews: PreviewProvider {
    @State static var isAllowDot=true
    @State static var isAllowDel=false
    static var previews: some View {
        // Print the pressed button
        //PaymentRequest_NumPad(completion: {print($0)})
        
        // Print the pressed button
        PaymentRequest_NumPad(completion: {(a:String)->() in
            print("DEBUG: Pressed button :\(a)")
        },isAllowDot: $isAllowDot,isAllowDel: $isAllowDel, isLarge: false)
    }
}
