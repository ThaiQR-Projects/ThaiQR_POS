//
//  TransactionsHistoryView.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/15/23.
//

import SwiftUI

struct TransactionsHistoryView: View {
    var body: some View {
        NavigationStack {
            TransactionsHistory_Table().navigationTitle("ประวัติรับเงิน")
        }
    }
}

struct TransactionsHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsHistoryView()
    }
}
