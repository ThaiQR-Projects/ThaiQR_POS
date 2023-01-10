//
//  QR_Scanner.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/10/23.
//

import SwiftUI
import CodeScanner

struct QR_Scanner: View {

    @Binding var ScanedVal: String
    @State var Debug = false
    @State var aScanMode = ScanMode.once
    //Result<ScanResult, ScanError>
    var body: some View {
        ZStack{
            VStack{
                if Debug{
                    HStack{
                        Text("ScanedVal: "+ScanedVal)
                        Spacer()
                    }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                    
                }
                CodeScannerView(codeTypes: [.qr], scanMode: aScanMode, simulatedData: "This is the simulated data", completion: HandleScan)
            }
            Text("Scaning").font(.system(.largeTitle))
        }
        
    }
    func HandleScan(pResult :Result<ScanResult, ScanError>){
        switch pResult {
        case .success(let result):
            if Debug{
                print(result.string)
            }
            ScanedVal = result.string
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

struct QR_Scanner_Previews: PreviewProvider {
    @State var aVal = ""
    static var previews: some View {
        QR_Scanner(ScanedVal: .constant(""), Debug: true)
    }
}
