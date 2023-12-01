//
//  UserAuthModel.swift
//  ShelterSwipe
//
//  Created by Claire Wang on 11/30/23.
//

import SwiftUI
import GoogleSignIn

class UserAuthModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var emailAddress: String = ""
    
    init(){
        check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let emailAddress = user.profile?.email
            let givenName = user.profile?.givenName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.emailAddress = emailAddress ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
            self.emailAddress = ""
        }
    }
    
    func check(){
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    self.errorMessage = "error: \(error.localizedDescription)"
                }
                
                self.checkStatus()
            }
        }
        
        func signIn(){
            
           guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
            
            let config = GIDConfiguration(clientID: "470419895318-djjo9370cktf9kanq6bsk53k3e5a6tk7.apps.googleusercontent.com")
            GIDSignIn.sharedInstance.configuration = config
            
            GIDSignIn.sharedInstance.signIn(
                withPresenting: presentingViewController)  { [unowned self] result, error in
                    guard error == nil else {
                        return self.checkStatus()
                    }
                    return self.checkStatus()
                }
        }
        
        func signOut(){
            GIDSignIn.sharedInstance.signOut()
            self.checkStatus()
        }
    }
