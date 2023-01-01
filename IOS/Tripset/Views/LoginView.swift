//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in

                //image
                Image("summer-bg")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.32, y: geomtry.size.height*0.54)
                    .position(x: geomtry.size.height*0.44, y: geomtry.size.height*0.54)
                    .position(x: geomtry.size.height*0.44, y: geomtry.size.height*0.54)
                    .position(x: geomtry.size.height*0.44, y: geomtry.size.height*0.54)
                    .clipped()
                    .ignoresSafeArea()
                
                //image title
                Text("Log in")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.34)
                    .font(Font.custom("LondonTwo", size: 62))
                    .foregroundColor(.white)
                
                //textfield - username
                TextField("username or email", text: $username)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.45)
                    
                
                //textfield - password
                TextField("password", text: $password)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.525)
                
                //log in
                Button("Log in") {
                    logIn()
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.white)
                .background(Color("main_dark"))
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.625)
                
                //forgot password
                Button("Forgot Password?") {
                    //forgotPassword()
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.695)
                
            }
        }
    }
    
    func logIn() {
        authModel.signIn(email: username, password: password)
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
