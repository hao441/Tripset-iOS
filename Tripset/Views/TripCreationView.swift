//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct TripCreationView: View {
    
    @State private var homeCity = ""
    @State private var startDate = ""
    @State private var endDate = ""
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in

                //image
                Image("summer-bg")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.4, y: -(geomtry.size.height*0.45))
                    .clipped()
                    .ignoresSafeArea()
                
                //where to title
                Text("Where to?")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.04)
                    .font(Font.custom("LondonTwo", size: 48))
                    .foregroundColor(.white)
                
                //create trip sub-title
                Text("Create Trip")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.2)
                    .font(Font.custom("Lexend", size: 24))
                    .foregroundColor(.black)
                
                Divider()
                    .frame(width: 300, height: 0.34)
                    .background(Color(white: 0.1, opacity: 0.2))
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.25)
                
                //where to - header
                Text("Where to")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.32)
                    .font(Font.custom("Lexend", size: 24))
                    .foregroundColor(.black)
                
                //textfield - home city
                TextField("Home City", text: $homeCity)
                    .font(Font.custom("Lexend", size: 21))
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 300, height: 50, alignment: .trailing)
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.375)
                
                //dates - header
                Text("Dates")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.45)
                    .font(Font.custom("Lexend", size: 24))
                    .foregroundColor(.black)
                
                ZStack {
                    //textfield - start date
                    TextField("Start", text: $startDate)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 135, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.305, y: geomtry.size.height*0.51)
                    //textfield - end date
                    TextField("End", text: $endDate)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 135, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.7, y: geomtry.size.height*0.51)
                }
                
                //add trip button
                Button("Add Trip") {
                    //addTrip()
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.white)
                .background(Color("main_dark"))
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3.5)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.6)
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct TripCreationView_Previews: PreviewProvider {
    static var previews: some View {
        TripCreationView()
    }
}
