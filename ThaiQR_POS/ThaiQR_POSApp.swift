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
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            AppTester()
        }
    }
}
