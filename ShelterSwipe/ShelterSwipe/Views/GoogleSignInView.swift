//
//  GoogleSignInView.swift
//  ShelterSwipe
//
//  Created by Claire Wang on 11/30/23.
//

import SwiftUI

struct GoogleSignInView: View {
    
    @State var index = 0
    @EnvironmentObject var vm: UserAuthModel
    
    var body: some View {
        
        GeometryReader{_ in
            
            VStack{
                Spacer()
                Spacer()
                HStack{
                    Image("logo")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                
                ZStack{
                    
                    SignUp(index: self.$index)
                        // changing view order ....
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                    
                }
                
                Spacer()
                
                Image("shelterswipe")
                    .resizable()
                    .frame(width: 240, height: 40)
                
                Spacer()
                Spacer()
            }
            
        }
        .background(Color.purple2.edgesIgnoringSafeArea(.all))
    }
}

struct CShape : Shape {
    
    func path(in rect: CGRect ) -> Path {
        
        return Path{ path in
            // right side curve
            
            path.move(to: CGPoint(x: rect.width, y: 120))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))

            
        }
    }
}
struct CShape1 : Shape {
    
    func path(in rect: CGRect ) -> Path {
        
        return Path{ path in
            // left side curve
            
            path.move(to: CGPoint(x: 0, y: 120))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))

            
        }
    }
}

struct Login : View {
    @EnvironmentObject var vm: UserAuthModel
    @Binding var index : Int
    var body: some View {
        VStack{
            
            HStack{
                
                VStack(spacing: 10){
                    Text("Login")
                        .foregroundColor(self.index == 0 ? .white : Color.purple2)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Capsule()
                        .fill(self.index == 0 ? .white : Color.clear)
                        .frame(width: 100, height: 5)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.top, 30)
            
            VStack{
                
                //BUTTON
                Button(action: {
                    vm.signIn()                }) {
                    Text("LOGIN WITH GOOGLE")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color.purple2)
                        .clipShape(Capsule())
                }
                .opacity(self.index == 0 ? 1 : 0)
                
            }
            .padding(.horizontal)
            .padding(.top, 30)
        }
        .padding()
        //bottom padding ...
        .padding(.bottom, 65)
        .background(Color.purple3)
        .clipShape(CShape())
        .contentShape(CShape())
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
        .onTapGesture {
            self.index = 0
        }
        .cornerRadius(30)
        .padding(.horizontal, 20)
    }
    
}

struct SignUp : View {
    @EnvironmentObject var vm: UserAuthModel
    @Binding var index : Int
    var body: some View {
        VStack{
            
            HStack{
                
                Spacer(minLength: 0)
                
                VStack(spacing: 10){
                    Text("SignUp")
                        .foregroundColor(self.index == 1 ? .white : Color.purple2)
                        .font(.title)
                        .fontWeight(.bold)
                    Capsule()
                        .fill(self.index == 1 ? .white : Color.clear)
                        .frame(width: 100, height: 5)
                }
                
            }
            .padding(.top, 30)
            
            VStack{
                
                //BUTTON
                Button(action: {
                    vm.signIn()
//                    vm.emailAddress
//                    vm.givenName
                }) {
                    Text("SIGNUP WITH GOOGLE")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color.purple2)
                        .clipShape(Capsule())
                }
                .opacity(self.index == 1 ? 1 : 0)
                        
            }
            .padding(.horizontal)
            .padding(.top, 30)
        }
        .padding()
        //bottom padding ...
        .padding(.bottom, 65)
        .background(Color.purple3)
        .clipShape(CShape1())
        // clipping the content shape
        .contentShape(CShape1())
        // shadow...
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
        .onTapGesture {
            self.index = 1
        }
        .cornerRadius(30)
        .padding(.horizontal, 20)
        
    }
    
}

//struct GoogleSignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoogleSignInView()
//    }
//}
