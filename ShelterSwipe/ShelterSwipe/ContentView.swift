//
//  ContentView.swift
//  ShelterSwipe
//
//  Created by Cassidy Xu on 11/18/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: UserAuthModel
    @EnvironmentObject var user: User
        
    var body: some View {
        VStack{
            if(vm.isLoggedIn){
                NavbarView()
            }else{
                GoogleSignInView()
            }
        }.navigationTitle("Login")
    }
}
    
//#Preview {
//    ContentView()
//}
