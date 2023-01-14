//
//  TransactionsHistory_TableCell.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/14/23.
//

import SwiftUI

struct TransactionsHistory_TableCell: View {
    @State var aAmont: Float
    @State var aDateString: String
    @State var payerName: String
    var aAmontString: String
    var body: some View {
        VStack{
            HStack{
                
                Text(aAmontString).font(.largeTitle)
                Spacer()
            }
            HStack{
                Spacer()
                Text(aDateString).font(.title)
            }
            HStack{
                Spacer()
                Text(payerName).font(.title3)
            }
            
               
            Divider()
        }.padding()
        
    }
    init(aAmont: Float, aDateString: String, payerName: String) {
        self.aAmont = aAmont
        self.aDateString = aDateString
        self.payerName = payerName
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = "฿"
        aAmontString = numberFormatter.string(from: NSNumber(value: aAmont))!
    }
}

struct TransactionsHistory_TableCell_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack() {
                Divider()
                TransactionsHistory_TableCell(aAmont: 50, aDateString: "11 มกราคม 2545, 15:40", payerName: "เมฑีนีร")
                TransactionsHistory_TableCell(aAmont: 5650, aDateString: "11 มกราคม 2545, 15:40", payerName: "เมฑีนีร")
                TransactionsHistory_TableCell(aAmont: 17850, aDateString: "11 มกราคม 2545, 15:40", payerName: "เมฑีนีร")
            }.padding()
        }
        
    }
}
