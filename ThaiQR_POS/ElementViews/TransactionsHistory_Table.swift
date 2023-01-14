//
//  TransactionsHistory_Table.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/14/23.
//

import SwiftUI

struct TransactionsHistory_Table: View {
    
    var body: some View {
        ScrollView {
            VStack() {
                Divider()
                TransactionsHistory_TableCell(aAmont: 50, aDateString: "11 มกราคม 2545, 15:40", payerName: "เมฑีนี** *****")
                TransactionsHistory_TableCell(aAmont: 5650, aDateString: "11 มกราคม 2545, 15:10", payerName: "สมช** *****")
                TransactionsHistory_TableCell(aAmont: 27850, aDateString: "11 มกราคม 2545, 14:59", payerName: "ก้า** *****")
                TransactionsHistory_TableCell(aAmont: 3832.23, aDateString: "11 มกราคม 2545, 14:43", payerName: "ศรา*** *****")
                TransactionsHistory_TableCell(aAmont: 150, aDateString: "11 มกราคม 2545, 14:20", payerName: "วรก**** ****")
                TransactionsHistory_TableCell(aAmont: 870, aDateString: "11 มกราคม 2545, 14:18", payerName: "นีร*** **********")
                TransactionsHistory_TableCell(aAmont: 34560, aDateString: "11 มกราคม 2545, 14:17", payerName: "ไปร** *******")
                TransactionsHistory_TableCell(aAmont: 250, aDateString: "11 มกราคม 2545, 14:03", payerName: "พญั** *****")
            }.padding()
        }
    }
}

struct TransactionsHistory_Table_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsHistory_Table()
    }
}
