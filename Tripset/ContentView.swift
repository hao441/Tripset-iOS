//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in
                //image
                Image("summer-bg")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.44, y: geomtry.size.height*0 - 250)
                    .clipped()
                    .ignoresSafeArea()
                
                //image title
                Text("Tripset")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.15)
                    .font(Font.custom("LondonTwo", size: 72))
                    .foregroundColor(.white)
                
                //subtitle
                Text("Welcome to the new way to travel")
                    .font(Font.custom("Lexend", size: 32))
                    .multilineTextAlignment(.center)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.4)
                    .frame(width: 300)
                
                //textfield - username
                TextField("username or email", text: $username)
                    .font(Font.custom("Lexend", size: 22))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.5)
                
                //textfield - password
                TextField("password", text: $username)
                    .font(Font.custom("Lexend", size: 22))
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.56)
                
                //log in
                Button("Log in") {
                    //logIn()
                }
                .font(Font.custom("Lexend", size: 22))
                .frame(width: 300, height: 50)
                .foregroundColor(Color.white)
                .background(Color.black)
                .cornerRadius(10)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.65)
                
                //forgot password
                Button("Forgot Password?") {
                    //forgotPassword()
                }
                .font(Font.custom("Lexend", size: 22))
                .frame(width: 300, height: 50)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.75)
                
                //divider
                Divider()
                    .frame(width: 300, height: 0.34)
                    .background(Color(white: 0.1, opacity: 0.2))
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.8)
                
                //sign up
                Button("Create an Account") {
                    //signUp()
                }
                .font(Font.custom("Lexend", size: 22))
                .frame(width: 300, height: 50)
                .foregroundColor(Color.white)
                .background(Color("Color"))
                .cornerRadius(10)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.88)
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
