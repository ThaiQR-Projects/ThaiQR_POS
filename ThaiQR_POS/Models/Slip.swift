//
//  Slip.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/11/23.
//

import Foundation

class Slip{
    var aStringData: String
    
    init(pStringData: String) {
        self.aStringData = pStringData
    }
    
    static func isValid(iStringData: String) -> Bool{
        
        func isPayloadValid(iStringData: String) -> Bool{
            
            print("Payload: \(iStringData)")
            
            return true
        }
        var pStringData = iStringData
        let PayloadStr: String, aCRC: String
        
        //Check 00 Payload
        if(pStringData.count>=4){
            
            let aID = pStringData.subString(from: 0, to: 2)
            if (aID != "00"){
                return false
            }
            
            let aLengthStr = pStringData.subString(from: 2, to: 4)
            if(aLengthStr.isNumber==false){
                return false
            }
            let aLength = Int(aLengthStr)
            if(pStringData.count<aLength!+4){
                return false
            }
            
            // Check sub-payload
            PayloadStr = pStringData.subString(from: 4, to: aLength!+4)
            if(isPayloadValid(iStringData: PayloadStr)==false){
                return false
            }
            pStringData = pStringData.subString(from: aLength!+4, to: pStringData.count)
            
        }else{
            return false
        }
        
        //Check 51 Country Code TH
        if(pStringData.count>=6){
            let aID = pStringData.subString(from: 0, to: 6)
            if (aID != "5102TH"){
                return false
            }
            pStringData = pStringData.subString(from: 6, to: pStringData.count)
        }else{
            return false
        }
        
        //Check 91 CRC CRC-16/CCITT-FALSE
        if(pStringData.count>=2){
            let aID = pStringData.subString(from: 0, to: 2)
            if (aID != "91"){
                return false
            }
            
            let aLengthStr = pStringData.subString(from: 2, to: 4)
            if(aLengthStr.isNumber==false){
                return false
            }
            let aLength = Int(aLengthStr)
            if(pStringData.count != aLength!+4){
                return false
            }
            
            aCRC = pStringData.subString(from: 4, to: aLength!+4)
            if(CRC.check(text: iStringData.subString(from: 0, to: iStringData.count-aLength!), key: aCRC)==false){
                return false
            }
        }else{
            return false
        }
        
        return true
    }
}
