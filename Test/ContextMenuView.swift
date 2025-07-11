//
//  ContextMenuView.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct ContextMenuView: View {
    
    @State var backgroundColor: Color = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
//        .contextMenu(menuItems: {
//            Button(action: {
//                backgroundColor = .yellow
//            }, label: {
//                Label("Share post", systemImage: "flame.fill")
//            })
//            
//            Button(action: {
//                backgroundColor = .red
//            }, label: {
//                Text("Report post")
//            })
//            
//            Button(action: {
//                backgroundColor = .green
//            }, label: {
//                HStack {
//                    Text("Like post")
//                    Image(systemName: "heart.fill")
//                }
//            })
//        })
    }
}

#Preview {
    ContextMenuView()
}
