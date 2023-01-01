//
//  ContentView.swift
//  Tripset
//
//  Created by Hao on 10/12/2022.
//

import SwiftUI
import Foundation
import AuthenticationServices

struct TripsView: View {
    
    @State private var homeCity = ""
    
    var body: some View {
        ZStack {
            GeometryReader { geomtry in

                //image
                Image("summer-bg-trim")
                    .resizable()
                    .frame(width: 1497, height: 1034)
                    .border(Color(white: 1, opacity: 0.5), width: 7)
                    .position(x: geomtry.size.height*0.629, y: geomtry.size.height*0.5)
                    .scaleEffect(CGSize(width: 1, height: -1))
                    .clipped()
                    .ignoresSafeArea()
                
                //welcome title
                Text("Trips")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.04)
                    .font(Font.custom("LondonTwo", size: 55))
                    .foregroundColor(.black)
                
                //Where are you from?
                Text("You have no trips planned")
                    .position(x: geomtry.size.width*0.5, y: geomtry.size.height*0.45)
                    .font(Font.custom("Lexend", size: 24))
                    .foregroundColor(.black)
                
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
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.55)
                
                
                Button("account") {
                    //account()
                }
                .font(Font.custom("Lexend", size: 32))
                .frame(width: 295, height: 40)
                .foregroundColor(Color.black)
                .position(x:geomtry.size.width*0.5, y: geomtry.size.height*0.99)
                
            }
        }
    }
    
    var line: some View {
        VStack { Divider().background(Color.black) }.padding(20)
        }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
