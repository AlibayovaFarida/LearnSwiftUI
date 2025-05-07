//
//  ExtractSubViews.swift
//  Test
//
//  Created by Apple on 02.05.25.
//

import SwiftUI

struct ExtractSubViews: View {
    struct Data {
        let icon: String
        let title: String
    }
    var data: [Data] = [.init(icon: "heart.fill", title: "heart"),.init(icon: "house", title: "house"), .init(icon: "moon.stars", title: "moon"),.init(icon: "star.square.fill", title: "star"), .init(icon: "wand.and.stars.inverse", title: "wand"), .init(icon: "globe.asia.australia", title: "globe"), .init(icon: "fireworks", title: "fireworks"), .init(icon: "sun.max.fill", title: "sun")]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(Array(data.enumerated()), id: \.offset) { index, item in
                    HorizontalScrollViewCell(icon: item.icon, title: item.title)
                }
            }
        }
        Spacer()
    }
}

#Preview {
    ExtractSubViews()
}

struct HorizontalScrollViewCell: View {
    var icon: String
    var title: String
    
    init(icon: String, title: String) {
        self.icon = icon
        self.title = title
    }
    var body: some View {
            VStack {
                Image(systemName: icon).font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
                Spacer()
                Text(title.capitalized).fontWeight(.semibold).font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            }.padding(.top, 56).padding(.bottom, 40)
                .frame(width: 160, height: 200)
                .background {
                    RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(
                        radius: 5)
                }.padding()
    }
}
