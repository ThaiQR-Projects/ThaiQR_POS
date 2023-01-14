//
//  ReceivePaymentView.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/14/23.
//

import SwiftUI

struct ReceivePaymentView: View {
    @Environment(\.dynamicTypeSize) var typeSize
    var body: some View {
        NavigationStack {
            VStack{
                GeometryReader { metrics in
                    GeometryReader { metrics in
                        HStack{
                            
                            Flex_Button(aText:"Clear", completion: {(a:String)->() in
                                print("DEBUG: Pressed button :\(a)")
                            })
                            Text(verbatim: "123").font(.largeTitle).frame(width: metrics.size.width * 0.70)
                        }
                    }.frame(height: metrics.size.height * 0.30)
                    VStack{
                        Spacer()
                        GeometryReader { metrics in
                            HStack{
                                
                                if(typeSize == .large){
                                    Spacer()
                                }
                                
                                PaymentRequest_NumPad(completion: {(a:String)->() in
                                    print("DEBUG: Pressed button :\(a)")
                                })
                                if(typeSize == .large){
                                    Flex_Button(aText:"QR", completion: {(a:String)->() in
                                        print("DEBUG: Pressed button :\(a)")
                                    }).frame(width: metrics.size.width * 0.30)
                                }else{
                                    Flex_Button(aText:"QR", completion: {(a:String)->() in
                                        print("DEBUG: Pressed button :\(a)")
                                    })
                                }
                                
                            }}.frame(height: metrics.size.height * 0.70)
                    }
                    
                    
                }.padding()
            }.navigationTitle("เรียกเก็บเงิน")
        }
    }
}

struct ReceivePayment_Previews: PreviewProvider {
    static var previews: some View {
        ReceivePaymentView()
    }
}
