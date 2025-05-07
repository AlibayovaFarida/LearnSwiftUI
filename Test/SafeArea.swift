//
//  SafeArea.swift
//  Test
//
//  Created by Apple on 02.05.25.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)).ignoresSafeArea()
            ScrollView {
                VStack() {
                    Text("Title goes here")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(0..<10) { index in
                        RoundedRectangle(cornerRadius:     25).fill(Color.gray)
                            .frame(height: 150)
                            .shadow(radius: 10)
                            .padding(20)
                    }
                }
            }
        }
        //        ZStack {
        //            Color(UIColor.systemPink)
        //            Text("Hello, World!")
        //                .frame(
        //                maxWidth: .infinity,
        //                maxHeight: .infinity )
        //        }.ignoresSafeArea()
    }
}

#Preview {
    SafeArea()
}
