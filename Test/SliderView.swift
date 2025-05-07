//
//  SliderView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct SliderView: View {
    @State var slideNumber: Double = 7
    @State var textColors: [Color] = [.red, .green, .yellow, .purple, .pink, .orange, .brown, .cyan, .mint, .teal]
    var body: some View {
        VStack{
            Text("Slide Number")
            Text(String(format: "%.0f", slideNumber)).foregroundColor(textColors[Int(slideNumber)])
//            Slider(value: $slideNumber)
//            Slider(value: $slideNumber, in: 0...10, step: 1.0)
            Slider(value: $slideNumber, in: 0...9, step: 1.0, onEditingChanged: { (_) in
                  print("Number changed: \(slideNumber)")
                },
                minimumValueLabel: Text("0"),
                maximumValueLabel: Text("9"),
                label: {
                Text("Title")
            })
        }
           
    }
}

#Preview {
    SliderView()
}
