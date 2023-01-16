//
//  Flex_Button.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/14/23.
//

import SwiftUI

struct Flex_Button: View {
    @State var isTap = false
    @State var aText: String
    var completion: (String) -> Void
    var aColor: Color
    var aImageSystemName: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).foregroundColor(aColor).opacity(isTap ? 0.3 : 0.6)
                Text(Image(systemName: aImageSystemName)).font(.largeTitle).opacity(isTap ? 0.6 : 1)
            
        }
            .onTapGesture {
            isTap = true
                completion(aText)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { isTap = false }
        }
    }
    
    init(isTap: Bool = false, aText: String, completion: @escaping (String) -> Void) {
        self.isTap = isTap
        self.aText = aText
        self.completion = completion
        self.aColor = .blue
        self.aImageSystemName = ""
        if(self.aText=="QR"){
            self.aColor = .green
            self.aImageSystemName = "qrcode"
        }
        if(self.aText=="Clear"){
            self.aColor = .red
            self.aImageSystemName = "clear"
        }
    }
    
}

struct Flex_Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Flex_Button(aText: "QR", completion: {print($0)})
            Flex_Button(aText: "Clear", completion: {print($0)})
        }
        
    }
}
