//
//  PaymentRequest_NumPad.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/13/23.
//

import SwiftUI

struct PaymentRequest_NumPad: View {
    var completion: (String) -> Void //Fuction injections
    var body: some View {
        Text("Hollow").onAppear(perform: {
            completion("aaa")
        })
    }
    public init(completion: @escaping (String) -> Void) {
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
