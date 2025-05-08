//
//  EnvironmentObject.swift
//  Test
//
//  Created by Apple on 08.05.25.
//

import SwiftUI

/* EnvironmentObject-in əsas məqsədi Parent View-dan child View-a viewModel stateobject-in göndərəndə lazımsız childlarda observedobject yazılmasın deyədir. Yəni əaslində parentdəki state child-ın içindəki child-a lazımdı ama biz ikinci child-a ötürmək ilk üçün birinci childda da yazırıq ama əslində ona lazım deyil.
*/

class EnvironmentViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var firstLoad: Bool = true
    func getData() {
        data.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple watch", "Macbook"])
        
    }
}

struct EnvironmentObjectParactise: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.data, id: \.self) { item in
                    NavigationLink(destination: DetailView(selectedItem: item)) {
                        Text(item)
                    }
                }
            }.navigationTitle("Apple devices")
                .onAppear {
                    if viewModel.firstLoad{
                        viewModel.getData()
                    }
                    viewModel.firstLoad = false
                }
        }.environmentObject(viewModel)
    }
}

struct DetailView: View {
    let selectedItem: String
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            NavigationLink {
                FinalView()
            } label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            }

        }
    }
}

struct FinalView: View {
    @EnvironmentObject var viewModel: EnvironmentViewModel
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    ForEach(viewModel.data, id: \.self) { item in
                        Text(item)
                    }
                }.foregroundColor(.white)
                    .font(.largeTitle)
            }
            
        }
    }
}
#Preview {
    EnvironmentObjectParactise()
}
