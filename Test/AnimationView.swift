//
//  Animation.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct AnimationView: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(Animation.default.repeatCount(6, autoreverses: true)) {
                    isAnimated.toggle()
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
//                .animation(Animation
//                            .default
//                            .repeatForever(autoreverses: true)) // deprecate olub
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)

            
            Spacer()
        }
    }
}

#Preview {
    AnimationView()
}
