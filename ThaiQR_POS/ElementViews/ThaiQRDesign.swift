//
//  ThaiQRDesign.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/16/23.
//

import SwiftUI

struct ThaiQRDesign: View {
    @Environment(\.horizontalSizeClass) var typeSize
    @State var QR_String:String
    var body: some View {
        ZStack {
            Color("BluePromptPay")
            .edgesIgnoringSafeArea(.top)
            VStack{
                
                HStack{
                    Image("ThaiQRLogo").frame(width: 65)
                    VStack{
                        Text("THAI QR").font(.title.weight(.bold)).foregroundColor(.white)
                        Text("PAYMENT").font(.title2.weight(.bold)).foregroundColor(.white)
                    }
                }
                
                Image("PromptPayLogo").resizable().scaledToFit().frame(width: 150).padding(.bottom)
                
                
                if (typeSize == .compact){
                    QR_Generator(QR_String: QR_String)
                }else{
                    QR_Generator(QR_String: QR_String,Size: 250)
                }
                
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0))
            
        }
    }
}

struct ThaiQRDesign_Previews: PreviewProvider {
    static var previews: some View {
        ThaiQRDesign(QR_String: "eroifjpwlfvijw;fkiswroifgswrkhvobqwednsdklfbhw;fhniasweofuhwpi;fhnwohuf;lesrfowij4prlkweuoh")
    }
}
