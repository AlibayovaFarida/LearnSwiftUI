//
//  ColorPickerView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State var backgroundColor: Color = .white
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker("Select a color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
        
    }
}

#Preview {
    ColorPickerView()
}
