//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct AccountView: View {
    
    @EnvironmentObject var authModel: AuthenticationModel
    @Environment(\.dismiss) var dismiss
    
    @State private var signOut = false
    @State private var presentAccountDeletionDialog = false
    
    @State private var homeCity = ""
    @State private var startDate = ""
    @State private var endDate = ""
    
    private func deleteAccount() {
      Task {
        if await authModel.deleteAccount() == true {
          dismiss()
        }
      }
    }

    
    var body: some View {
        NavigationStack {
            ZStack {
                GeometryReader { geomtry in
                    
                    //image
                    Image("summer-bg")
                        .resizable()
                        .frame(width: 1497, height: 1034)
                        .border(Color(white: 1, opacity: 0.5), width: 7)
                        .position(x: geomtry.size.height*0.725, y: -(geomtry.size.height*0.45))
                        .clipped()
                        .ignoresSafeArea()
                    
                    //where to title
                    Text("Account")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.04)
                        .font(Font.custom("LondonTwo", size: 48))
                        .foregroundColor(.white)
                    
                    //create trip sub-title
                    Text("User Details  ")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.2)
                        .font(Font.custom("Lexend", size: 24))
                        .foregroundColor(.black)
                    
                    Divider()
                        .frame(width: 300, height: 0.34)
                        .background(Color(white: 0.1, opacity: 0.2))
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.25)
                    
                    ZStack { //username
                        Text("Username")
                            .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.3)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(Color(white: 0, opacity: 0.3))
                        
                        //textfield - home city
                        Text("Username")
                            .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.33)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(.black)
                    }
                    
                    ZStack { //first name
                        Text("First Name")
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.38)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(Color(white: 0, opacity: 0.3))
                        
                        //textfield - home city
                        Text("First Name")
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.41)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(.black)
                    }
                    
                    ZStack { //last name
                        Text("Last Name")
                            .position(x: geomtry.size.width*0.7, y: geomtry.size.height*0.38)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(Color(white: 0, opacity: 0.3))
                        
                        //textfield - home city
                        Text("Last Name")
                            .position(x: geomtry.size.width*0.7, y: geomtry.size.height*0.41)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(.black)
                    }
                    
                    ZStack { //home city
                        Text("Home City")
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.46)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(Color(white: 0, opacity: 0.3))
                        
                        //textfield - home city
                        Text("Home City")
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.49)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(.black)
                    }
                    
                    ZStack { //email address
                        Text("Email Address")
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.54)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(Color(white: 0, opacity: 0.3))
                        
                        //textfield - home city
                        Text("Email Address")
                            .position(x: geomtry.size.width*0.3, y: geomtry.size.height*0.57)
                            .font(Font.custom("Lexend", size: 24))
                            .foregroundColor(.black)
                        
                        Divider()
                            .frame(width: 300, height: 0.34)
                            .background(Color(white: 0.1, opacity: 0.2))
                            .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.63)
                    }
                    
                    
                    ZStack {
                        //add trip button
                        Button("Change Password") {
                            //addTrip()
                        }
                        .font(Font.custom("Lexend", size: 21))
                        .foregroundColor(Color.black)
                        .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.68)
                        
                        //add trip button
                        Button("Change Email Address") {
                            //addTrip()
                        }
                        .font(Font.custom("Lexend", size: 21))
                        .foregroundColor(Color.black)
                        .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.74)
                        
                        Divider()
                            .frame(width: 300, height: 0.34)
                            .background(Color(white: 0.1, opacity: 0.2))
                            .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.79)
                        
                        Button{
                            authModel.signOut()
                            authModel.authenticationStatus = .unauthenticated
                        } label: {
                            Text("Sign out")
                        }
                        .font(Font.custom("Lexend", size: 21))
                        .frame(width: 295, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color("main_dark"))
                        .cornerRadius(10)
                        .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3.5)
                        .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.86)
                        
                        Divider()
                            .frame(width: 300, height: 0.34)
                            .background(Color(white: 0.1, opacity: 0.2))
                            .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.925)
                        
                        Button(role: .destructive) {
                            presentAccountDeletionDialog.toggle()
                        } label: {
                            Text("Delete Account")
                        }
                        .font(Font.custom("Lexend", size: 21))
                        .frame(width: 295, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color("delete"))
                        .cornerRadius(10)
                        .shadow(color: Color("delete_shadow"), radius: 1, x: 0, y: 3.5)
                        .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.98)
                    }
                    .confirmationDialog("Deleting your account is permanent. Do you want to delete your account?",
                                        isPresented: $presentAccountDeletionDialog, titleVisibility: .visible) {
                      Button("Delete Account", role: .destructive, action: deleteAccount)
                      Button("Cancel", role: .cancel, action: { })
                    }
                }
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
    
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
