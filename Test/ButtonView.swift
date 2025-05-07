//
//  ButtonView.swift
//  Test
//
//  Created by Apple on 02.05.25.
//

import SwiftUI

struct ButtonView: View {
    @State var title: String = "This is my title"
    var body: some View {
        VStack(spacing: 15) {
            Text(title)
            Button("Click me") {
                self.title = "Button was pressed"
            }
            
            Button {
                self.title = "I like this title"
            } label: {
                Image(systemName: "heart.fill").foregroundColor(Color.red)
            }
        }

    }
}

#Preview {
    ButtonView()
}
