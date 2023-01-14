//
//  QR_Generator.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/10/23.
//

import SwiftUI

struct QR_Generator: View {
    @State var QR_String: String
    @State var Size = CGFloat(150)
    @State var Debug = false
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: getQRCodeDate(text: QR_String)!)!)
                            .resizable()
                            .frame(width: Size, height: Size)
            if Debug{
                HStack{
                    Text("Text: \(QR_String)").font(.system(.footnote))
                    Spacer()
                }.frame(maxWidth: Size)
                    .padding(EdgeInsets(top: -12, leading: 0, bottom: 0, trailing: 0))
            }
        }
        
    }
    
    func getQRCodeDate(text: String) -> Data? {
            guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
            let data = text.data(using: .ascii, allowLossyConversion: false)
            filter.setValue(data, forKey: "inputMessage")
            guard let ciimage = filter.outputImage else { return nil }
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let scaledCIImage = ciimage.transformed(by: transform)
            let uiimage = UIImage(ciImage: scaledCIImage)
            return uiimage.pngData()!
        }
}

struct QR_Generator_Previews: PreviewProvider {
    static var previews: some View {
        QR_Generator(QR_String: "Hello", Debug: true)
    }
}
