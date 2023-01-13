//
//  CalculatorView.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/13/23.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Number_Button(aText:"1")
                Number_Button(aText:"2")
                Number_Button(aText:"3")
            }
            HStack{
                Number_Button(aText:"4")
                Number_Button(aText:"5")
                Number_Button(aText:"6")
            }
            HStack{
                Number_Button(aText:"7")
                Number_Button(aText:"8")
                Number_Button(aText:"9")
            }
            HStack{
                Number_Button(aText:".")
                Number_Button(aText:"0")
                Number_Button(aText:"del")
            }
        }.padding()
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
