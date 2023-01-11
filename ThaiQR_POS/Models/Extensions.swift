//
//  Extensions.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/11/23.
//

import Foundation

extension String {
    func subString(from: Int, to: Int) -> String {
       let startIndex = self.index(self.startIndex, offsetBy: from)
       let endIndex = self.index(self.startIndex, offsetBy: to)
       return String(self[startIndex..<endIndex])
    }
    var isNumber: Bool {
            let digitsCharacters = CharacterSet(charactersIn: "0123456789")
            return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
        }
}
