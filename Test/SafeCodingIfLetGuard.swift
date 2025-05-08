//
//  SafeCodingIfLetGuard.swift
//  Test
//
//  Created by Apple on 07.05.25.
//

import SwiftUI

struct SafeCodingIfLetGuard: View {
    @State var userId: Int? = 2
    @State var isLoading: Bool = false
    @State var title: String?
    var body: some View {
        ScrollView{
            Text("hello")
            if isLoading {
                ProgressView()
            }
            
            if let text = title {
                Text(text)
            }
            
        }.onAppear {
//            if let id = userId {
//                isLoading = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                    title = "\(id). data is loaded 🥳"
//                    isLoading = false
//                }
//            }
            
            guard let id = userId else {
                title = "Error. Data is not valid"
                return
            }
            
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                title = "\(id). data is loaded 🥳"
                isLoading = false
            }
        }
    }
}

#Preview {
    SafeCodingIfLetGuard()
}
