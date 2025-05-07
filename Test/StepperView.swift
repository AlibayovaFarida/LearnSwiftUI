//
//  StepperView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct StepperView: View {
    @State var stepValue: Int = 0
    @State var stepWidth: CGFloat = 0
    var body: some View {
        VStack{
            Stepper("Stepper: \(stepValue)", value: $stepValue, step: 3)
            Stepper("Width: \(Int(stepWidth))") {
                stepWidth += 10
            } onDecrement: {
                stepWidth -= 10
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                .frame(width: 100 + stepWidth, height: 100)
        }.padding(.horizontal)
        

    }
}

#Preview {
    StepperView()
}
