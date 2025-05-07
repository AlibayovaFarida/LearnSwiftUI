//
//  TransitionView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct TransitionView: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("BUTTON") {
                    withAnimation(.easeInOut) { // <- animation here
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: AnyTransition.opacity.animation(.easeInOut)
                    ))
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TransitionView()
}
