//
//  ContentView.swift
//  Authentication
//
//  Created by Hao on 4/12/2022.
//

import SwiftUI
import Firebase

struct AuthenticationView: View {
    @ObservedObject var userAuth: AuthenticationModel = AuthenticationModel()
    // MARK: - View

    @ViewBuilder              // no need return inside
    var body: some View {
        
        Test()
        
//        switch(userAuth.authenticationStatus) {
//        case .unauthenticated:
//            StartView().environmentObject(userAuth)
//        case .new:
//            WelcomeView().environmentObject(userAuth)
//        case .authenticated:
//            AccountView().environmentObject(userAuth)
//        }
        
    }
}
