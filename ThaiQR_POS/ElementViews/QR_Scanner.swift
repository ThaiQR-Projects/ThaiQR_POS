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
    @State var aOpacityOn = true
    @State var aColor = Color.blue
    //Result<ScanResult, ScanError>
    var body: some View {
        VStack{
            if Debug{
                HStack{
                    Text("ScanedVal: "+ScanedVal)
                    Spacer()
                }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                
            }
            ZStack{
                
                    CodeScannerView(codeTypes: [.qr], scanMode: aScanMode, simulatedData: "This is the simulated data", completion: HandleScan)
                
                Text("โปรดส่องไปที่สลิป\nเพื่อตรวจสอบ").font(.system(.largeTitle))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .opacity(0.6)
                RoundedRectangle(cornerRadius: 25).stroke(aColor, lineWidth: 4)
                    .animation(.easeInOut(duration: 0.5), value: aColor)
                    .opacity(aOpacityOn ? 1:0)
                    
                    
                    .padding()
            }
            .onAppear{
                withAnimation(Animation.spring().repeatForever().speed(0.8)){
                    aOpacityOn.toggle()
                }
            }
        }
        
        
    }
    
    func HandleScan(pResult :Result<ScanResult, ScanError>){
        switch pResult {
        case .success(let result):
            if Debug{
                print(result.string)
            }
            Task {
                aColor = Color.green
                try? await Task.sleep(nanoseconds: 3_000_000_000) //(1 second = 1_000_000_000 nanoseconds)
                
                aColor = Color.blue
                

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
