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
                getAlert(text: "This is alert")
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    
    /// Gets an alert with a specified title.
    ///
    /// This function creates and returns an alert immediately. The alert will have a title based on the text parametr but it will NOT have a message.
    /// ```
    /// getAlert(text: "Hello") -> Alert(title: Text("Hello")
    /// ```
    ///
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Return an alert with a title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}

// MARK: PREVIEW
#Preview {
    MarkupsAndDocumentation()
}
