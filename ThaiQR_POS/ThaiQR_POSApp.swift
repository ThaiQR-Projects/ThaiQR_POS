//
//  ThaiQR_POSApp.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/10/23.
//

import SwiftUI

@main
struct ThaiQR_POSApp: App {
    init(){
        print("DEBUG: In App Init")
        print(Slip.isValid(iStringData: "0046000600000101030140225202202192TigfEjHASicIVY985102TH91041175"))
        print(String(crc16("0046000600000101030140225202202197OxgghnF6xvQiQ2dj5102TH9104", 60), radix:16)) //F7F6 correct.
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            AppTester()
        }
    }
}
