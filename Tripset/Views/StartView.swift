//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift

struct StartView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    @State private var username = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geomtry in
                    //image
                    Image("summer-bg")
                        .resizable()
                        .frame(width: 1497, height: 1034)
                        .border(Color(white: 1, opacity: 0.5), width: 7)
                        .position(x: geomtry.size.height*0.44, y: geomtry.size.height < 700 ? -(geomtry.size.height*0.3 + 120) : -(geomtry.size.height*0.3))
                        .clipped()
                        .ignoresSafeArea()
                    
                    //image title
                    Text("Tripset")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.1125)
                        .font(Font.custom("LondonTwo", size: 72))
                        .foregroundColor(.white)
                    
                    //subtitle
                    Text("Welcome to the new way to travel")
                        .font(Font.custom("Lexend", size: 32))
                        .multilineTextAlignment(.center)
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.42)
                        .frame(width: 300)
                    
                    //log in
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Log in")
                    }
                    .font(Font.custom("Lexend", size: 21))
                    .frame(width: 295, height: 45)
                    .foregroundColor(Color.white)
                    .background(Color("main"))
                    .cornerRadius(5)
                    .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.55)
                    .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3)
                    
                    //divider
                    ZStack {
                        Divider()
                            .frame(width: 125, height: 0.34)
                            .background(Color(white: 0.1, opacity: 0.2))
                            .position(x: geomtry.size.width*0.7, y: geomtry.size.height*0.61)
                        Text("O")
                            .font(Font.custom("Lexend", size: 12.5))
                            .foregroundColor(Color(white: 0.1, opacity: 0.5))
                            .position(x: geomtry.size.width*0.488, y: geomtry.size.height*0.61)
                        Text("R")
                            .font(Font.custom("Lexend", size: 12.5))
                            .foregroundColor(Color(white: 0.1, opacity: 0.5))
                            .position(x: geomtry.size.width*0.513, y: geomtry.size.height*0.61)
                        Divider()
                            .frame(width: 125, height: 0.34)
                            .background(Color(white: 0.1, opacity: 0.2))
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.61)
                    }
                    
                    
                    //sign up
                    Button("Continue with Email") {
                        //signUp()
                    }
                    .font(Font.custom("Lexend", size: 18))
                    .frame(width: 295, height: 45)
                    .foregroundColor(Color.white)
                    .background(Color("main_dark"))
                    .cornerRadius(5)
                    .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.67)
                    
                    SignInWithAppleButton { request in
                        authModel.handleSignInWithAppleRequest(request)
                    } onCompletion: { result in
                        authModel.handleSignInWithAppleCompletion(result)
                    }
                    .signInWithAppleButtonStyle((ColorScheme(.light) != nil) ? .black : .white)
                    .frame(width: 295, height: 45)
                    .cornerRadius(4)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.735)
                    
                    Button(action: {
                        authModel.signInWithGoogle()
                    }, label: {
                        HStack {
                            Image("g-logo")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .padding(EdgeInsets(top: 0, leading: -28, bottom: 0, trailing: 24))
                            
                            Text("Continue with Google")
                        }
                    })
                    .font(Font.custom("Roboto", size: 18))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    .frame(width: 295, height: 45)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .border(Color.black, width: 2)
                    .cornerRadius(5)
                    .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.8)
                    
                    //
                    //                GoogleSignInButton(scheme: .light, style: .wide, state: .normal) {
                    //                    authModel.signInWithGoogle()
                    //                }
                    //                .frame(width: 295, height: 50)
                    //                .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.801)
                }
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
    
    
    
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
