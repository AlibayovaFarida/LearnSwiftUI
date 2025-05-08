//
//  CustomModelInSwiftUI.swift
//  Test
//
//  Created by Apple on 07.05.25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let displayName: String
    let username: String
    let followers: Int
    let isVerified: Bool
}
struct CustomModelInSwiftUI: View {
    @State var users: [UserModel] = [
        .init(displayName: "Alan", username: "@alan_alan", followers: 241, isVerified: false),
        .init(displayName: "Jack", username: "@jack1", followers: 525, isVerified: true),
        .init(displayName: "Lisa", username: "@Lisa_li", followers: 901, isVerified: true),
        .init(displayName: "Tina", username: "@tina_04", followers: 333, isVerified: false),
        .init(displayName: "Mari", username: "@ma_ri", followers: 424, isVerified: true),
        .init(displayName: "Lola", username: "@lolllll", followers: 827, isVerified: true),
        .init(displayName: "Mike", username: "@mike_2019", followers: 314, isVerified: false)
    ]
    var body: some View {
        List {
            Section(header: Text("Users")) {
                ForEach(users) { user in
                    HStack(spacing: 15){
                        Circle().frame(width: 45, height: 45)
                        VStack(alignment: .leading){
                            HStack{
                                Text(user.displayName).font(.headline)
                                if user.isVerified {
                                    Image(systemName: "checkmark.seal.fill").foregroundColor(.blue).font(.subheadline)
                                }
                            }
                            Text(user.username).font(.caption).foregroundColor(Color.secondary)
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("\(user.followers)").font(.headline)
                            Text("Followers").font(.caption).foregroundColor(Color.secondary)
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    CustomModelInSwiftUI()
}
