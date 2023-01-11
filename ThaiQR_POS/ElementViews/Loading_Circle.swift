//
//  Loading_Circle.swift
//  ThaiQR_POS
//
//  Created by Maitree Hirunteeyakul on 1/11/23.
//

import SwiftUI

struct Loading_Circle: View {
    @State var appear = false

        var body: some View {
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(width: 40, height: 40)
                .rotationEffect(Angle(degrees: appear ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear {
                    appear = true
                }
        }
}

struct Loading_Circle_Previews: PreviewProvider {
    static var previews: some View {
        Loading_Circle()
    }
}
