//
//  TabViewComponent.swift
//  Test
//
//  Created by Apple on 06.05.25.
//

import SwiftUI

struct TabViewComponent: View {
    @State var selectedTab: Int = 0
    var body: some View {
        TabView(selection: $selectedTab){
            MyHomeScreen(selectedTab: $selectedTab).tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }.tag(1)
            MyPhotosScreen().tabItem {
                Image(systemName: "photo.fill")
                Text("Images")
            }.tag(2)
            MyProfileScreen().tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }.tag(3)
        }
    }
}
struct MyHomeScreen: View {
    @Binding var selectedTab: Int
    var newWordList: [String] = ["apologise", "determination", "relive", "obligation", "spectacular", "support", "culinary", "cuisine", "discover", "modern nomad", "charity"]
    var body: some View {
        NavigationView {
            List {
                ForEach(newWordList, id: \.self) { word in
                    Text(word)
                }
            }
            .navigationTitle("New Word List")
            .navigationBarItems(
                leading: Image(systemName: "ellipsis"),
                trailing: Button(action: {
                    selectedTab = 3
                }, label: {
                    Image(systemName: "person.fill")
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                })
            )
        }
    }
}
struct MyPhotosScreen: View {
    var images: [String] = [
        "image-1", "image-2", "image-3","image-4","image-5","image-6","image-7","image-8","image-9","image-10","image-11","image-12","image-13"
    ]
    var natureImages: [String] = ["image-3", "image-4", "image-6", "image-10", "image-12", "image-13"]
    var animalImages: [String] = ["image-1", "image-2", "image-5", "image-7", "image-8", "image-9", "image-11"]
    var body: some View {
        NavigationView {
            ScrollView {
                TabView{
                    ForEach(images, id: \.self) { image in
                        Image(image).resizable()
                            .tag(images.firstIndex(of: image))
                        .padding()
                            .background()
                            .cornerRadius(10)
                            .padding()
                            .frame(width: 350, height: 220)
                            .shadow(radius: 5)
                        
                    }
                }.frame(height: 260).tabViewStyle(PageTabViewStyle())
                    .background(RadialGradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))], center: .center, startRadius: 5, endRadius: 300))
                ImageCollectionView(images: natureImages, title: "Nature images")
                ImageCollectionView(images: animalImages, title: "Animal images")
            }.navigationTitle("My photos")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct MyProfileScreen: View {
    var body: some View {
        NavigationView{
                List{
                    Section(header: Text("User").font(.subheadline)) {
                        HStack{
                            Circle().frame(width: 50, height: 50)
                            Spacer()
                            Text("@username").font(.headline)
                        }
                    }
                    Section(header: Text("Setting").font(.subheadline)) {
                        Text("About")
                        Text("Language")
                        Text("Network")
                    }
                    Section(header: Text("Activity")) {
                        Text("My devices")
                        Text("Follwers")
                        Text("Followings")
                    }
                    Section(header: Text("Device").font(.subheadline)) {
                        Text("About")
                        Text("Language")
                        Text("Network")
                    }
                    Section(header: Text("Another")) {
                        Text("My devices")
                        Text("Follwers")
                        Text("Followings")
                    }
                }.navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
            }
    }
}
struct ImageCollectionView: View {
    var images: [String]
    var title: String
    var body: some View {
        VStack(alignment: .leading){
            Text(title).font(.headline).fontWeight(.bold).padding(.horizontal)
                .padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(images, id: \.self) { image in
                        VStack(alignment: .leading){
                            Image(image).resizable()
                            Text(image)
                        }.padding()
                            .background()
                            .cornerRadius(10)
                            .padding()
                            .frame(width: 300, height: 200)
                            .shadow(radius: 5)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    TabViewComponent()
}
