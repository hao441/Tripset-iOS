//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct WelcomeView: View {
    
    @EnvironmentObject var authModel: AuthenticationModel
    
    @ObservedObject var searchModel = SearchModel()
    @State var stringData = ""

    @State private var startSearch: Bool = false
    @State var searchResult = ""
    @State var refresh: Bool = false
    
    var body: some View {
        
        ZStack {
                GeometryReader { geomtry in
                    
                    //image
                    Image("summer-bg")
                        .resizable()
                        .frame(width: 1497, height: 1034)
                        .border(Color(white: 1, opacity: 0.5), width: 7)
                        .position(x: geomtry.size.height*0.01, y: geomtry.size.height*1.55)
                        .scaleEffect(CGSize(width: 1, height: -1))
                        .clipped()
                        .ignoresSafeArea()
                    
                    //welcome title
                    Text("Welcome")
                        .position(x: geomtry.size.width*0.22, y: geomtry.size.height*0.04)
                        .font(Font.custom("LondonTwo", size: 35))
                        .foregroundColor(.white)
                    
                    //user name
                    //                Text("\(authModel.displayName)")
                    //                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.04)
                    //                    .font(Font.custom("LondonTwo", size: 35))
                    //                    .foregroundColor(.white)
                    
                    //Where are you from?
                    Text("Where are you from?")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.41)
                        .font(Font.custom("LondonTwo", size: 30))
                        .foregroundColor(.black)
                    
                    //textfield - home city
                    Button {
                        startSearch = true
                    } label: {
                        Text("\(searchResult == "" ? "Enter Location" : searchResult)")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .font(Font.custom("Lexend", size: 21))
                    .multilineTextAlignment(.center)
                    .buttonStyle(.bordered)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.5)
                    .foregroundColor(.black).opacity(searchResult == "" ? 0.3 : 1)
                    .fullScreenCover(isPresented: $startSearch) {
                        SearchThis(searchResult: self.$searchResult)
                    }
                    
                    
                    //submit button
                    Button("Submit") {
                        //submitHomeCity()
                    }
                    .font(Font.custom("Lexend", size: 21))
                    .frame(width: 295, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color("main_dark"))
                    .cornerRadius(10)
                    .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3.5)
                    .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.6)
                    
                    
                }
                .navigationDestination(isPresented: $startSearch) {
                    TripsView()
            }
            
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
