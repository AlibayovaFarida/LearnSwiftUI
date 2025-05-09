//
//  OnboardingView.swift
//  Test
//
//  Created by Apple on 08.05.25.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: STATES AND PROPERTIES
    
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State var name: String = ""
    @State var age: Double = 42
    @State var gender: String = "Male"
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    // MARK: BODY
    var body: some View {
        ZStack {
                switch onboardingState {
                    case 0:
                        WelcomeSection
                        .transition(transition).tag(0)
                    case 1:
                    AddNameSection
                            .transition(transition).tag(1)
                    case 2:
                    AddAgeSection
                            .transition(transition).tag(2)
                    case 3:
                       AddGenderSection
                            .transition(transition).tag(3)
                    default:
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.green)
                }
            VStack {
                    Spacer()
                    bottomButton
            }
            .padding(30)
        }.alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

// MARK: ONBOARDING VIEWS AND BUTTON
extension OnboardingView {
    
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "SIGN UP" :
            onboardingState == 3 ? "FINISH" :
            "NEXT"
        )
            .font(.headline)
            .foregroundColor(.purple)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                handleNextButtonPressed()
        }
    }
    
    private var WelcomeSection: some View {
        ZStack {
            Color.clear
            VStack(spacing: 40) {
                Image(systemName: "heart.text.square.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                Text("Welcome to app")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
    
    private var AddNameSection: some View {
        ZStack {
            Color.clear
            VStack {
                Text("What is your name?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                TextField("Enter your name...", text: $name)
                    .padding()
                    .background(
                        Color.white
                    ).frame(height: 60)
                    .cornerRadius(5)
                    .padding()
            }
        }
    }
    
    private var AddAgeSection: some View {
        ZStack {
            Color.clear
            VStack(spacing: 20) {
                Text("What is your age?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("\(String(format: "%.0f", age))")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Slider(value: $age, in: 18...100, step: 1)
                    .tint(.white)
            }.padding(.horizontal)
        }
    }
 
    private var AddGenderSection: some View {
        ZStack {
            Color.clear
            VStack(spacing: 20) {
                Text("What is your age?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Picker(selection: $gender, label:
                    Text(gender.count > 1 ? gender : "Select a gender")
                        .font(.headline)
                        .foregroundColor(.purple)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                , content: {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Not binary").tag("Not binary")
                }).pickerStyle(MenuPickerStyle())
                    .tint(.purple)
                    .font(.caption)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .padding(.horizontal)
            }
        }
    }
}
// MARK: FUNCTIONS
extension OnboardingView {
    
    func handleNextButtonPressed() {
        
        // CHECK INPUTS
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long! 😩")
                return
            }
        case 3:
            guard gender.count > 1 else {
                showAlert(title: "Please select a gender before moving forward! 😳")
                return
            }
        default:
            break
        }
        
        // GO TO NEXT SECTION
        if onboardingState == 3 {
            signIn()
        } else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
    
}
#Preview {
    OnboardingView()
}
