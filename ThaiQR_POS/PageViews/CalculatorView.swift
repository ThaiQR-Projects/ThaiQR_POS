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
                Number_Button(aText:"1", completion: completion)
                Number_Button(aText:"2", completion: completion)
                Number_Button(aText:"3", completion: completion)
            }
            HStack{
                Number_Button(aText:"4", completion: completion)
                Number_Button(aText:"5", completion: completion)
                Number_Button(aText:"6", completion: completion)
            }
            HStack{
                Number_Button(aText:"7", completion: completion)
                Number_Button(aText:"8", completion: completion)
                Number_Button(aText:"9", completion: completion)
            }
            HStack{
                Number_Button(aText:".", completion: completion)
                Number_Button(aText:"0", completion: completion)
                Number_Button(aText:"del", completion: completion)
            }
        }.padding()
    }
    func completion(aString: String){
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
