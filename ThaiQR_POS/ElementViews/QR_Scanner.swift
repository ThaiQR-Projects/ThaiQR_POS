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
    @State var aOpacityOn = false
    @State var aColor = Color.blue
    //Result<ScanResult, ScanError>
    var body: some View {
        VStack{
            if Debug{
                VStack{
                    HStack{
                        Text("ScanedVal: \(ScanedVal)")
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("Thai miniQR: \(String(Slip.isValid(iStringData: ScanedVal)))")
                            .foregroundColor(Slip.isValid(iStringData: ScanedVal) ? .green:.red)
                        
                    }
                    Divider()
                    HStack{
                        
                        Button("Clear"){
                            ScanedVal=""
                        }.foregroundColor(.red)
                        Spacer()
                        Button("Copy"){
                            let pasteboard = UIPasteboard.general
                            pasteboard.string = ScanedVal
                        }
                        
                    }
                }.padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
            }
            ZStack{
                
                CodeScannerView(codeTypes: [.qr], scanMode: aScanMode, simulatedData: "This is the simulated data", completion: HandleScan).ignoresSafeArea()
                
                Text("โปรดส่องไปที่สลิป\nเพื่อตรวจสอบ").font(.system(.largeTitle))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.white)
                    .opacity(0.6)
                RoundedRectangle(cornerRadius: 25).stroke(aColor, lineWidth: 4)
                    .opacity(aOpacityOn ? 1:0)
                    .animation(.easeInOut(duration: 0.5), value: aColor)
                    
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
        QR_Scanner(ScanedVal: .constant("00460006000001010301402252020012771igbsB1TkTce2j0X5102TH9104064D"), Debug: true)
    }
}
