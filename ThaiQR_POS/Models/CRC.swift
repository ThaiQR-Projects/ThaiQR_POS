//
//  CRC.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/11/23.
//

import Foundation

class CRC{
    
//    var aCRC: String
//
//    init(pCRC: String) {
//        self.aCRC = pCRC
//    }
//
    
    static func decode(text: String)->String{
        return String(crc16(text, Int32(text.count)), radix:16).uppercased()
    }
    
    static func check(text: String, key: String)->Bool{
        //print("DEBUG CRC text: \(text), key: \(key)")
        var CorrectKey = decode(text: text)
        while CorrectKey.count < key.count{
            CorrectKey = "0"+CorrectKey
        }
        if (CorrectKey == key) || (CorrectKey == key.uppercased()){
            return true
        }
        else{
            return false
        }
    }
}
