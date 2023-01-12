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
    @State private var isShowingDetailView = false
    //Result<ScanResult, ScanError>
    var body: some View {
        NavigationStack {
                VStack {
                        //NavigationLink(destination: Text("Second View"), isActive: $isShowingDetailView) { EmptyView() }
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
                    
                    CodeScannerView(codeTypes: [.qr], scanMode: aScanMode, simulatedData: "This is the simulated data", completion: HandleScan).edgesIgnoringSafeArea(.bottom).onTapGesture(count:5,perform: {Debug = !Debug})
                    
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
                    print("DEBUG: Appere!")
                    aOpacityOn = false
                    withAnimation(Animation.spring().repeatForever().speed(0.8)){
                        aOpacityOn.toggle()
                    }
                }
            
                    }
                    .navigationTitle("ตรวจสลิปโอนเงิน")
                    .navigationDestination(isPresented: $isShowingDetailView){
                        Loading_Circle()
                    }
                }
            
        }
        
        func Set3SecColor(color: Color){
            Task {
                aColor = color
                try? await Task.sleep(nanoseconds: 3_000_000_000) //(1 second = 1_000_000_000 nanoseconds)
                aColor = Color.blue
            }
        }
        
        func HandleScan(pResult :Result<ScanResult, ScanError>){
            switch pResult {
            case .success(let result):
                if Debug{
                    print("DEBUG ScanedVal: \(result.string)")
                }
                
                let isValidThaiQRSlip = Slip.isValid(iStringData: result.string)
                if(isValidThaiQRSlip){
                    Set3SecColor(color: .green)
                    isShowingDetailView = true
                }else{
                    Set3SecColor(color: .red)
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
