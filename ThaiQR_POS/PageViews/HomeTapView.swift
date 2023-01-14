//
//  HomeTapView.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/13/23.
//

import SwiftUI

struct HomeTapView: View {
    @State private var selection = 3
    var body: some View {
        TabView(selection:$selection){
            CalculatorView().badge(0).tabItem {
                Label("รวมบิล", systemImage: "plusminus.circle.fill")
            }.tag(1)
            ReceivePaymentView().badge(0).tabItem {
                Label("เก็บเงิน", systemImage: "creditcard.fill")
                
            }.tag(2)
            SlipVerifierView().badge(0).tabItem {
                Label("ตรวจสลิป", systemImage: "creditcard.viewfinder")
                //qrcode.viewfinder
            }.tag(3)
            Loading_Circle().badge(0).tabItem {
                Label("ประวัติรับเงิน", systemImage: "list.bullet.rectangle.fill")
            }.tag(4)
        }
    }
}

struct HomeTapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTapView()
    }
}
