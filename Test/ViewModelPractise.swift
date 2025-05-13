//
//  ViewModelPractise.swift
//  Test
//
//  Created by Apple on 07.05.25.
//

import SwiftUI

struct PersonModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let surname: String
    let age: Int
}
class PeopleViewModel: ObservableObject {
    @Published var people: [PersonModel] = []
    @Published var isLoading: Bool = false
    @Published var isFirstLoad: Bool = true
    // MARK: initializer yazanda onAppear()-i yazma
//    init() {
//        getPeople()
//    }
    func getPeople() {
        let person1 = PersonModel(name: "Nigar", surname: "Zeynalova", age: 22)
        let person2 = PersonModel(name: "Nazile", surname: "Huseynli", age: 31)
        let person3 = PersonModel(name: "Ayla", surname: "Memmedova", age: 21)
        
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.people.append(contentsOf: [person1, person2, person3])
            self.isLoading = false
        }
    }
    
    func deletePerson(index: IndexSet) {
        people.remove(atOffsets: index)
    }
    
    func movePerson(indices: IndexSet, newOffset: Int) {
        people.move(fromOffsets: indices, toOffset: newOffset)
    }
}
struct ViewModelPractise: View {
    @StateObject var peopleViewModel: PeopleViewModel = PeopleViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                if peopleViewModel.isLoading {
                    ProgressView()
                }
                List {
                    ForEach(peopleViewModel.people) { person in
                        HStack {
                            Text("\(person.surname) \(person.name)")
                            Spacer()
                            Text("\(person.age)")
                        }
                    }.onDelete(perform: peopleViewModel.deletePerson)
                        .onMove(perform: peopleViewModel.movePerson)
                }
                .onAppear {
                    if peopleViewModel.isFirstLoad {
                        peopleViewModel.getPeople()
                        peopleViewModel.isFirstLoad = false
                    }
                }
            .listStyle(GroupedListStyle())
                    .navigationTitle("People")
                    .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: RandomScreen(peopleViewModel: peopleViewModel), label: {
                        Image(systemName: "arrow.right")
                    }))
            }
        }
    }
    
}

struct RandomScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var peopleViewModel: PeopleViewModel
    @State var sum: Int = 0
    
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            //            Button("Go back") {
            //                presentationMode.wrappedValue.dismiss()
            //            }.foregroundColor(Color.white)
            //                .font(.title)
            //                .fontWeight(.bold)
            VStack {
                ForEach(peopleViewModel.people) { person in
                    Text("\(person.name) - \(person.age)")
                }
            }
        }
    }
    
}

#Preview {
    ViewModelPractise()
}
