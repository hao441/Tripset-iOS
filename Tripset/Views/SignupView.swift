//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct SignupView: View {
    
    @State private var firstName = ""
    @State private var emailAddress = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var authModel: AuthenticationModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in

                //image
                Image("summer-bg")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.35, y: geomtry.size.height*0.52)
                    .scaleEffect(CGSize(width: -1, height: 1))
                    .clipped()
                    .ignoresSafeArea()
                
                //image title
                Text("Sign up")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.27)
                    .font(Font.custom("LondonTwo", size: 62))
                    .foregroundColor(.white)
                
                //textfield - first name
                TextField("First Name", text: $firstName)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.375)
                    
                
                //textfield - email address
                TextField("Email Address", text: $emailAddress)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.445)
                
                //textfield - password
                TextField("Password", text: $password)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.515)
                
                //textfield - password
                TextField("Confirm Password", text: $confirmPassword)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.585)
                    
                
                //log in
                Button("Sign up") {
                    signUpWithEmail()
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.white)
                .background(Color("main_dark"))
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3.5)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.68)
                
            }
        }
    }
    
    private func signUpWithEmail() {
        authModel.signUpWithEmail(email: emailAddress, password: password)
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
