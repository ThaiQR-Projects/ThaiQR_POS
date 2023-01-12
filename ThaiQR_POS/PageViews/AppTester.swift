//
//  AppTester.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/11/23.
//

import SwiftUI

struct AppTester: View {
    @State var aVal=""
    var body: some View {
        QR_Scanner(ScanedVal: $aVal, Debug: false, aScanMode: .continuous)
    }
}

struct AppTester_Previews: PreviewProvider {
    static var previews: some View {
        AppTester()
    }
}
