//
//  OnAppearAndOnDisappear.swift
//  Test
//
//  Created by Apple on 07.05.25.
//

import SwiftUI

struct OnAppearAndOnDisappear: View {
    @State private var isLoading = true
    @State private var data: [String] = []
    @State private var count = 0
    @State private var timer: Timer?
    var body: some View {
        ScrollView {
            VStack {
                if isLoading {
                    ForEach(0..<5) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 100)
                            .padding()
                            
                    }
                } else {
                    ScrollView{
                        ForEach(data, id: \.self) { item in
                            Text(item)
                                .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                data = ["Data 1", "Data 2", "Data 3"]
                isLoading = false
            }
        }
        
//        Text("Say: \(count)")
//            .onAppear {
//                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
//                    count += 1
//                }
//            }
//            .onDisappear {
//                timer?.invalidate()
//                timer = nil
//                print("Timer is stopped.")
//            }
    }
}

#Preview {
    OnAppearAndOnDisappear()
}
