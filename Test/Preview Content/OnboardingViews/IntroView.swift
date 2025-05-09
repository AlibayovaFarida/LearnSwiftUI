//
//  IntroView.swift
//  Test
//
//  Created by Apple on 08.05.25.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("signed_in") var currentSignedIn: Bool = false
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]), center: .topLeading, startRadius: 5, endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()
            
            if currentSignedIn {
                ProfileView()
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

#Preview {
    IntroView()
}
