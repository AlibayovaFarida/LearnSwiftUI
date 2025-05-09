//
//  AsyncImagePractise.swift
//  Test
//
//  Created by Apple on 09.05.25.
//

import SwiftUI

struct AsyncImagePractise: View {
    let url = URL(string: "https://picsum.photos/200")
    var body: some View {
        AsyncImage(url: url)
    }
}

#Preview {
    AsyncImagePractise()
}
