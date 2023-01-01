//
//  AuthenticationModel.swift
//  Authentication
//
//  Created by Hao on 6/12/2022.
//
import Foundation
import FirebaseAuth

import AuthenticationServices
import CryptoKit

import GoogleSignIn

import Combine
import Firebase
import FirebaseFirestore

enum userStatus {
    case unauthenticated
    case new
    case authenticated
}

enum providers {
    case email
    case other
}

class AuthenticationModel: ObservableObject {
    @Published var authenticationStatus: userStatus = .unauthenticated     // published property to update view
    @Published var user: User?
    @Published var displayName = ""
    @Published var provider: Bool?
    
    @Published var email = ""
    @Published var testValue: Int = 0
    @Published var userValues: [String: Any] = [:]
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    private var currentNonce: String?
    
    init() {
        registerAuthStateHandler()
        
        print("hi")
    }
    
    deinit {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func registerAuthStateHandler() {
        
        let db = Firestore.firestore()
        
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.user = user
                self.displayName = user.displayName ?? ""
                self.authenticationStatus = .authenticated
                self.email = user.email!
                self.provider = user.providerID == "EmailAuthProviderID" ? true : false
                
                let docRef = db.collection("users").document(user.uid)
                
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                        print("Document data: \(dataDescription)")
                        
                        
                        for key in document.data()!.keys {
                            self.userValues[key] = document.data()![key]
                        }
                        print(self.userValues["testValue"]!)
                        self.testValue = self.userValues["testValue"] as! Int
                    } else {
                        print("Document does not exist")
                    }
                }
                
            } else {
                self.authenticationStatus = .unauthenticated
            }
        }
    }
}

extension UIApplication{
    func rootController() -> UIViewController {
        guard let window = connectedScenes.first as? UIWindowScene else {return .init()}
        guard let viewController = window.windows.last?.rootViewController else {return .init()}
        
        return viewController
    }
}

    extension AuthenticationModel {
        func signIn(email: String, password: String) {
            let _ = Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if (authResult != nil) {
                    self.authenticationStatus = .authenticated
                }
                print(error?.localizedDescription as Any)
            }
      }

      func signUpWithEmail(email: String, password: String) {
          let db = Firestore.firestore()
          
          let _ = Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              
              if (authResult != nil) {
                  self.user = authResult?.user
                  self.email = authResult?.user.email ?? ""
                  self.authenticationStatus = .authenticated
                  
                  db.collection("users").document(self.user!.uid).setData([
                      "creationDate": Date.now,
                      "testValue" : 1
                  ])
                  
                  
              }
          }
      }

      func signOut() {
        do {
          try Auth.auth().signOut()
        }
        catch {
            print(error.localizedDescription)
          //errorMessage = error.localizedDescription
        }
      }
        
        func forgotPassword(email: String) async -> Bool {
          do {
              try await Auth.auth().sendPasswordReset(withEmail: email)
              return true
          }
          catch {
              print(error.localizedDescription)
              return false
            //errorMessage = error.localizedDescription
          }
        }
        
        func changePassword(newPassword: String) async -> Bool {
            do {
                try await Auth.auth().currentUser?.updatePassword(to: newPassword)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
        
        func changeEmailAddress(newEmailAddress: String) async -> Bool {
            do {
                try await Auth.auth().currentUser?.updateEmail(to: newEmailAddress)
                return true
            } catch {
                print(error.localizedDescription)
                return false
            }
        }

        func deleteAccount() async -> Bool {
          do {
            try await user?.delete()
            return true
          }
          catch {
            print(error.localizedDescription)
            return false
          }
        }


    //MARK: Sign in with Google
        
        func signInWithGoogle() {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)

            // Start the sign in flow!
            GIDSignIn.sharedInstance.signIn(with: config, presenting: UIApplication.shared.rootController()) { user, error in

              if let error = error {
                  print(error.localizedDescription)
                return
              }

              guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
              else {
                return
              }

              let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                             accessToken: authentication.accessToken)

                Task {
                    do {
                        let result = try await Auth.auth().signIn(with: credential)
                        guard let newUserStatus = result.additionalUserInfo?.isNewUser else { return }
                        
                        if newUserStatus == true {
                            DispatchQueue.main.async{
                                 self.authenticationStatus = .new
                            }
                            
                        }
                        
                        if let currentDisplayName = Auth.auth().currentUser?.displayName, !currentDisplayName.isEmpty {
                          // current user is non-empty, don't overwrite it
                        }
                        else {
                            let changeRequest = result.user.createProfileChangeRequest()
                            changeRequest.displayName = result.user.displayName
                          do {
                            try await changeRequest.commitChanges()
                            self.displayName = Auth.auth().currentUser?.displayName ?? ""
                          }
                          catch {
                            print("Unable to update the user's displayname: \(error.localizedDescription)")
                            //errorMessage = error.localizedDescription
                          }
                        }
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        

    // MARK: Sign in with Apple
      func handleSignInWithAppleRequest(_ request: ASAuthorizationAppleIDRequest) {
          request.requestedScopes = [.fullName, .email]
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
      }

      func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        if case .failure(let failure) = result {
            print(failure.localizedDescription)
          //errorMessage = failure.localizedDescription
        }
        else if case .success(let authorization) = result {
          if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
              fatalError("Invalid state: a login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
              print("Unable to fetdch identify token.")
              return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
              print("Unable to serialise token string from data: \(appleIDToken.debugDescription)")
              return
            }

            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            Task {
              do {
                let result = try await Auth.auth().signIn(with: credential)
                  guard let newUserStatus = result.additionalUserInfo?.isNewUser else { return }
                  
                  if newUserStatus == true {
                      DispatchQueue.main.async{
                           self.authenticationStatus = .new
                      }
                  }
                  
                await updateDisplayName(for: result.user, with: appleIDCredential)
                
                
              }
              catch {
                print("Error authenticating: \(error.localizedDescription)")
              }
            }
          }
        }
      }

      func updateDisplayName(for user: User, with appleIDCredential: ASAuthorizationAppleIDCredential, force: Bool = false) async {
        if let currentDisplayName = Auth.auth().currentUser?.displayName, !currentDisplayName.isEmpty {
          // current user is non-empty, don't overwrite it
        }
        else {
          let changeRequest = user.createProfileChangeRequest()
          changeRequest.displayName = appleIDCredential.displayName()
          do {
            try await changeRequest.commitChanges()
            self.displayName = Auth.auth().currentUser?.displayName ?? ""
          }
          catch {
            print("Unable to update the user's displayname: \(error.localizedDescription)")
            //errorMessage = error.localizedDescription
          }
        }
      }

      func verifySignInWithAppleAuthenticationState() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let providerData = Auth.auth().currentUser?.providerData
        if let appleProviderData = providerData?.first(where: { $0.providerID == "apple.com" }) {
          Task {
            do {
              let credentialState = try await appleIDProvider.credentialState(forUserID: appleProviderData.uid)
              switch credentialState {
              case .authorized:
                break // The Apple ID credential is valid.
              case .revoked, .notFound:
                // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                self.signOut()
              default:
                break
              }
            }
            catch {
            }
          }
        }
      }

    }

    extension ASAuthorizationAppleIDCredential {
      func displayName() -> String {
        return [self.fullName?.givenName, self.fullName?.familyName]
          .compactMap( {$0})
          .joined(separator: " ")
      }
    }

    // Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }

    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }


