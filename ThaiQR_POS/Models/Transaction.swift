//
//  Transaction.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/14/23.
//

import Foundation

class Transaction: Identifiable{
    
    var aAmount: Float
    var aDate: NSDate
    var apayerName: String
    var aID = UUID()
    
    init(aAmount: Float, apayerName: String, aDate: NSDate) {
        self.aAmount = aAmount
        self.aDate = aDate
        self.apayerName = apayerName
    }
    
    class func DateDescription() -> String{
        return "NSString(self.aDate)"
    }
}
