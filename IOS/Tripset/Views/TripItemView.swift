//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct TripItemView: View {
    
    @State private var homeCity = ""
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in

                //image
                Image("summer-bg-trim")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.62, y: geomtry.size.height*0.475)
                    .clipped()
                    .ignoresSafeArea()
                
                //welcome title
                Text("Destination")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.035)
                    .font(Font.custom("LondonTwo", size: 48))
                    .foregroundColor(.white)
                
                //add trip button
                Button("Create Itinerary") {
                    //addTrip()
                }
                .font(Font.custom("Lexend", size: 21))
                .frame(width: 236, height: 48)
                .foregroundColor(Color.white)
                .background(Color("main_dark"))
                .cornerRadius(10)
                .shadow(color: Color("main_shadow"), radius: 1, x: 0, y: 3.5)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.55)
                
            
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct TripItemView_Previews: PreviewProvider {
    static var previews: some View {
        TripItemView()
    }
}
