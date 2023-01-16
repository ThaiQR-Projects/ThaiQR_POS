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
    @State var isAllowDel:Bool = false
    @State var aNum:String = ""
    @State var isShowingQRView:Bool = false
    var body: some View {
        NavigationStack {
            VStack{
                GeometryReader { metrics in
                    GeometryReader { metrics in
                        HStack{
                            
                            Flex_Button(aText:"Clear", completion: press)
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
                                    PaymentRequest_NumPad(completion: press, isAllowDot:$isAllowDot, isAllowDel:$isAllowDel, isLarge: false)
                                }else{
                                    PaymentRequest_NumPad(completion: press, isAllowDot:$isAllowDot, isAllowDel:$isAllowDel, isLarge: true)
                                }
                                if(typeSize != .compact){
                                    Flex_Button(aText:"QR", completion: press).frame(width: metrics.size.width * 0.30).disabled(!(Double(aNum) ?? 0>0)).opacity(Double(aNum) ?? 0>0 ? 1:0.6)
                                }else{
                                    Flex_Button(aText:"QR", completion: press).disabled(!(Double(aNum) ?? 0>0)).opacity(Double(aNum) ?? 0>0 ? 1:0.6)
                                }
                                
                            }}.frame(height: metrics.size.height * 0.70)
                    }
                    
                    
                }.padding()
            }.navigationTitle("เรียกเก็บเงิน")
                .navigationDestination(isPresented: $isShowingQRView){
                    Loading_Circle()
                }
        }
    }
    
    
    init(isAllowDot: Bool = true, isAllowDel: Bool = false, aNum: String = "") {
        self.isAllowDot = isAllowDot
        self.isAllowDel = isAllowDel
        self.aNum = aNum
    }
    
    func updateAllowanceDotDel(){
        
        if(aNum=="0"){
            aNum = ""
        }
        
        if(aNum.contains(".")){
            isAllowDot = false
        }else{
            isAllowDot = true
        }
        if(aNum != ""){
            isAllowDel=true
        }else{
            isAllowDel=false
        }
    }
    
    
    func press(key:String){
        if(key=="Clear"){
            aNum=""
        }else if(key=="QR"){
            if(Double(aNum) ?? 0>0){
                var bNum = Double(aNum)
                aNum=""
                print("DEBUG: Requesting QR amount:\(bNum!)")
                isShowingQRView = true
            }
        }
        else if(key=="."){
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
        updateAllowanceDotDel()
        print("DEBUG F1: \(aNum) key:\(key)")
        
        
    }
    
}

struct ReceivePayment_Previews: PreviewProvider {
    static var previews: some View {
        ReceivePaymentView(aNum: "")
    }
}
