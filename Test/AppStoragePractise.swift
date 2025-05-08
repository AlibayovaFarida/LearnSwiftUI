//
//  AppStoragePractise.swift
//  Test
//
//  Created by Apple on 08.05.25.
//

import SwiftUI

struct AppStoragePractise: View {
    @AppStorage("text") var currentText: String?
    @State var textFieldtext: String = ""
    var body: some View {
        VStack {
            TextField("Add text...", text: $textFieldtext).textFieldStyle(.roundedBorder)
            if let text = currentText {
                Text(text)
            }
            Button("Save".uppercased()) {
                currentText = textFieldtext
            }
        }.padding()
    }
}

#Preview {
    AppStoragePractise()
}
