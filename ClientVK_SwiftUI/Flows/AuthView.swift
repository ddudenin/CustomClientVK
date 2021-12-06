//
//  ContentView.swift
//  ClientVK_SwiftUI
//
//  Created by Дмитрий Дуденин on 30.11.2021.
//

import SwiftUI
import Combine

struct AuthView: View {
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrectCredentialsWarning: Bool = false
    @Binding var isUserSignedIn: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter
            .default
            .publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter
            .default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    ).removeDuplicates()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.gradientStart,
                    Color.gradientEnd,
                ]),
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1))
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VK Client")
                            .font(.largeTitle)
                            .padding(.top, 50)
                            .foregroundColor(Color.textColor)
                    }
                    
                    VStack {
                        HStack {
                            Image(systemName: "person.circle")
                                .foregroundColor(Color.gradientEnd)
                            TextField("login", text: $login)
                                .frame(maxWidth: 150)
                        }
                        HStack {
                            Image(systemName: "key.fill")
                                .foregroundColor(Color.gradientEnd)
                            SecureField("password", text: $password)
                                .frame(maxWidth: 150)
                            
                        }
                    }
                    .frame(maxWidth: 250)
                    .padding(.top, 20)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Spacer(minLength: 25)
                    
                    Button(action: verifySignInData ) {
                        HStack {
                            Image(systemName: "chevron.right.circle")
                            Text("Sign in")
                        }
                        .font(.body)
                    }
                    .frame(maxHeight: 15)
                    .padding()
                    .background(Color.buttonColor)
                    .foregroundColor(Color.buttonTextColor)
                    .cornerRadius(40)
                    .disabled(login.isEmpty || password.isEmpty)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(isPresented: $showIncorrectCredentialsWarning, content: {
            Alert(title: Text("Ошибка"),
                  message: Text("Введены неверные данные пользователя"),
                  dismissButton: .cancel())
        })
    }
    
    private func verifySignInData() {
        if login == "1" && password == "1" {
            isUserSignedIn = true
        } else {
            showIncorrectCredentialsWarning = true
            password = ""
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(isUserSignedIn: .constant(false))
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
