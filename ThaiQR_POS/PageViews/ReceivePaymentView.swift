//
//  ReceivePaymentView.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/14/23.
//

import SwiftUI

struct ReceivePaymentView: View {
    @Environment(\.horizontalSizeClass) var typeSize
    @State var isAllowDot:Bool = true
    @State var isAllowDel:Bool = true
    @State var aNum:String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                GeometryReader { metrics in
                    GeometryReader { metrics in
                        HStack{
                            
                            Flex_Button(aText:"Clear", completion: {(a:String)->() in
                                aNum=""
                            })
                            Text(verbatim: aNum).font(.largeTitle).frame(width: metrics.size.width * 0.70)
                        }
                    }.frame(height: metrics.size.height * 0.30)
                    VStack{
                        Spacer()
                        GeometryReader { metrics in
                            HStack{
                                if(typeSize != .compact){
                                    Spacer()
                                }
                                if(typeSize == .compact){
                                    PaymentRequest_NumPad(completion: press, isAllowDot:isAllowDot, isAllowDel:isAllowDel, isLarge: false)
                                }else{
                                    PaymentRequest_NumPad(completion: press, isAllowDot:isAllowDot, isAllowDel:isAllowDel, isLarge: true)
                                }
                                if(typeSize != .compact){
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
            // \(isAllowDel ? "true":"false")
        }
    }
    
    init(isAllowDot: Bool = true, isAllowDel: Bool = true, aNum: String = "") {
        
        self.isAllowDot = isAllowDot
        self.isAllowDel = isAllowDel
        self.aNum = aNum
        
        
    }
    
    func press(key:String){
        
        if(key=="."){
            if(!aNum.contains(".")){
                if(aNum == ""){
                    aNum = "0."
                }
                else{
                    aNum = aNum+"."
                }
            }
            
        }
        else if(key=="del"){
            if(aNum.count>0){
                aNum = aNum.subString(from: 0, to: aNum.count-1)
            }
        }
        else{
            if(aNum=="" && key=="0"){
                
            }else{
                aNum = aNum+key
            }
        }
        
        print("DEBUG F1: \(aNum) key:\(key) isAllowDel:\(isAllowDel)")
        isAllowDel = false
        
    }
}

struct ReceivePayment_Previews: PreviewProvider {
    static var previews: some View {
        ReceivePaymentView(aNum: "")
    }
}
