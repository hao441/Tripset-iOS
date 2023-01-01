//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct ItineraryItemView: View {
    
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
                    .position(x: geomtry.size.height*0.664, y: geomtry.size.height*1.55)
                    .scaleEffect(CGSize(width: 1, height: -1))
                    .clipped()
                    .ignoresSafeArea()
                
                //where to title
                Text("Itinerary")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.04)
                    .font(Font.custom("LondonTwo", size: 48))
                    .foregroundColor(.white)
                
                Text("Add Itinerary Item")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.15)
                    .font(Font.custom("Lexend", size: 32))
                    .foregroundColor(.black)
                
                Divider()
                    .frame(width: 300, height: 0.34)
                    .background(Color(white: 0.1, opacity: 0.2))
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.2)
                
                
                //Title
                ZStack {
                    Text("Title")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.275)
                        .font(Font.custom("Lexend", size: 24))
                        .foregroundColor(.black)
                    
                    TextField("Title", text: $homeCity)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.325)
                }
                
                //Location
                ZStack {
                    Text("Location")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.4)
                        .font(Font.custom("Lexend", size: 24))
                        .foregroundColor(.black)
                    
                    TextField("Location", text: $homeCity)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.45)
                }
                
                //Category
                ZStack {
                    Text("Category")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.525)
                        .font(Font.custom("Lexend", size: 24))
                        .foregroundColor(.black)
                    
                    TextField("Category", text: $homeCity)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 300, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.575)
                }
                
                //dates
                ZStack {
                    Text("Dates")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.65)
                        .font(Font.custom("Lexend", size: 24))
                        .foregroundColor(.black)
                    //textfield - start date
                    TextField("Start", text: $startDate)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 135, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.305, y: geomtry.size.height*0.7)
                    //textfield - end date
                    TextField("End", text: $endDate)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 135, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.7, y: geomtry.size.height*0.7)
                }
                
                ZStack {
                    Text("Time")
                        .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.775)
                        .font(Font.custom("Lexend", size: 24))
                        .foregroundColor(.black)
                    //textfield - start date
                    TextField("Start", text: $startDate)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 135, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.305, y: geomtry.size.height*0.825)
                    //textfield - end date
                    TextField("End", text: $endDate)
                        .font(Font.custom("Lexend", size: 21))
                        .opacity(0.7)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 135, height: 50, alignment: .trailing)
                        .position(x: geomtry.size.width*0.7, y: geomtry.size.height*0.825)
                }
                
                //add trip button
                Button("Create Itinerary") {
                    //addTrip()
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.white)
                .background(Color("main_dark"))
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3.5)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.96)
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct ItineraryItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryItemView()
    }
}
