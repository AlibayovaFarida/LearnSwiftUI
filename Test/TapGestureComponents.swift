//
//  TapGestureComponents.swift
//  Test
//
//  Created by Apple on 07.05.25.
//

import SwiftUI

struct TapGestureComponents: View {
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                ForEach(0..<10) { index in
                    ExtractedView(rowIndex: index)
                }
            }
        }
    }
}

#Preview {
    TapGestureComponents()
}

struct ExtractedView: View {
    @State var rowIndex: Int
    @State var isSelected: Bool = false
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(!isSelected ? Color.gray : rowIndex%2==0 ? Color.green : Color.purple)
            .frame(height: 100).padding(.horizontal)
            .onTapGesture {
                isSelected.toggle()
            }
    }
}
