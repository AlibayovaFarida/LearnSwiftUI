//
//  ColorsView.swift
//  Test
//
//  Created by Apple on 28.04.25.
//

import SwiftUI

struct ColorsView: View {
    let number: Int
    init(number: Int){
        self.number = number
    }
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack() {
                ForEach(0..<10) { index1 in
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(){
                            ForEach(0..<5) { index2 in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding(.top, 20)
                                    .padding(.bottom, 20)
                                    .overlay {
                                        Text("\(index1*index2)")
                                    }
                                Spacer().frame(width:100, height: 20).background(Color(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ColorsView(number: 1)
}
