//
//  ToggleView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct ToggleView: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Status:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(
                isOn: $toggleIsOn,
                label: {
                Text("Change status")
            })
                .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))))

            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleView()
}
