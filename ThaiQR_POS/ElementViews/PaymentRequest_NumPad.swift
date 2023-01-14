//
//  PaymentRequest_NumPad.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/13/23.
//

import SwiftUI

struct PaymentRequest_NumPad: View {
    var completion: (String) -> Void //Fuction injections
    @State var isAllowDot = true
    @State var isAllowDel = true
    var body: some View {
        VStack{
            HStack{
                Number_Button(aText:"1", completion: completion)
                Number_Button(aText:"2", completion: completion)
                Number_Button(aText:"3", completion: completion)
            }
            HStack{
                Number_Button(aText:"4", completion: completion)
                Number_Button(aText:"5", completion: completion)
                Number_Button(aText:"6", completion: completion)
            }
            HStack{
                Number_Button(aText:"7", completion: completion)
                Number_Button(aText:"8", completion: completion)
                Number_Button(aText:"9", completion: completion)
            }
            HStack{
                Number_Button(aText:".", completion: completion).opacity(isAllowDot ? 1:0.5).disabled(!isAllowDot)
                Number_Button(aText:"0", completion: completion)
                Number_Button(aText:"del", completion: completion).opacity(isAllowDel ? 1:0.5).disabled(!isAllowDel)
            }
        }
        
        
//        Text("Hollow").onAppear(perform: {
//            completion("aaa")
//        })
    }
    public init(completion: @escaping (String) -> Void) {
            print("Init")
            completion("Init")
            self.completion = completion
        }
}

struct PaymentRequest_NumPad_Previews: PreviewProvider {
    static var previews: some View {
        // Print the pressed button
        //PaymentRequest_NumPad(completion: {print($0)})
        
        // Print the pressed button
        PaymentRequest_NumPad(completion: {(a:String)->() in
            print("DEBUG: Pressed button :\(a)")
        })
    }
}
