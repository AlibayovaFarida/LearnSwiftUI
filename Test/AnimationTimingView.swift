//
//  AnimationTimingView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct AnimationTimingView: View {
    
    @State var isAnimating: Bool = false
//    @State var isAnimating2: Bool = false
    let timing: Double = 3.0
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
//                withAnimation(Animation.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 1.0)) {
//                    isAnimating.toggle()
//                }
//                withAnimation(.spring()) {
//                    isAnimating.toggle()
//                }
//                withAnimation(.linear(duration: timing)) {
//                    isAnimating2.toggle()
//                }
//                withAnimation(.easeIn(duration: timing)) {
//                    isAnimating.toggle()
//                }
//                withAnimation(.easeInOut(duration: timing)) {
//                    isAnimating.toggle()
//                }
//                withAnimation(.easeOut(duration: timing)) {
//                    isAnimating.toggle()
//                }

            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.spring(response: 0.7, dampingFraction: 0.7, blendDuration: 0.5), value: isAnimating)
//                .animation(.spring(
//                            response: 0.5,
//                            dampingFraction: 0.7,
//                            blendDuration: 1.0))
                //.animation(.spring())
                //.animation(Animation.linear(duration: timing))
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating2 ? 350 : 50, height: 100)
//                .animation(Animation.easeIn(duration: timing))
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeInOut(duration: timing))
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(Animation.easeOut(duration: timing))

        }
    }
}

#Preview {
    AnimationTimingView()
}
