//
//  MarkupsAndDocumentation.swift
//  Test
//
//  Created by Apple on 07.05.25.
//

import SwiftUI

struct MarkupsAndDocumentation: View {
    // MARK: PROPERTIES
    
    @State var data: [String] = ["Apples", "Oranges", "Bananas"]
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    /* Working copy - thigs to do
       1) Fix title
       2) Fix alert
     */
    
    var body: some View {
        NavigationView {
            ScrollView{
                Text("Hello world!")
                ForEach(data, id: \.self) { name in
                    Text(name).font(.headline)
                }
            }
            .navigationTitle("Documentations")
            .navigationBarItems(trailing: Button("Alert", action: {
                showAlert.toggle()
            }))
            .alert(isPresented: $showAlert) {
                getAlert(title: "This is alert")
            }
        }
    }
    
    // MARK: FUNCTIONS
    func getAlert(title: String) -> Alert {
        return Alert(title: Text(title))
    }
}

// MARK: PREVIEW
#Preview {
    MarkupsAndDocumentation()
}
