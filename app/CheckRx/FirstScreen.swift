//
//  ContentView.swift
//  CheckRx
//
//  Created by Kevin Zheng on 2022-07-16.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                let backgroundColor = Color("crx_green")
                backgroundColor.ignoresSafeArea()
                
                VStack {
                    Image("logo_white")
                        .resizable()
                        .frame(width: 180.0, height: 180.0)
                    
                    Text("The future of personal health management")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 210.0)
                        .offset(y: -27)
                    
                    VStack {
                        NavigationLink(destination: SigninScreen()) {
                            HStack {
                                Text("Sign in")
                                    .fontWeight(.bold)
                                    .font(.headline)
                            }
                            .frame(maxWidth: 320, maxHeight: 25)
                            .padding()
                            .foregroundColor(Color("crx_green"))
                            .background(Color.white.clipShape(RoundedRectangle(cornerRadius: 15)))
                        }
                        
                        Button(action: { print("tapped sign in")
                        }) {
                            HStack {
                                Text("Create an account")
                                    .fontWeight(.bold)
                                    .font(.headline)
                            }
                            .frame(maxWidth: 318, maxHeight: 23)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color("crx_green").clipShape(RoundedRectangle(cornerRadius: 15)))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        }.offset(y: 15)
                    }.offset(y: 60)
                    
                }.offset(y: -50)
            }
        }.accentColor(.white)
    }
}

struct SigninScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View {
        
        ZStack {
            let backgroundColor = Color("crx_green")
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Image("logo_white")
                    .resizable()
                    .frame(width: 180.0, height: 180.0)
                
                Text("The future of personal health management")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 210.0)
                    .offset(y: -27)
                
                VStack {

                    VStack(alignment: .leading) {
                        Text("Username").foregroundColor(.white).offset(y: 7)
                        TextField("", text: $username)
                            .disableAutocorrection(true)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).accentColor(.black)
                                .autocapitalization(.none)
                        
                        Text("Password").foregroundColor(.white).offset(y: 7)
                        SecureField("", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).accentColor(.black)
                    }.frame(width: 350, height: 200)
                    Text("Forgot your password?").font(.callout).foregroundColor(.orange).underline().offset(y:-25)
                    
                    Button(action: { print("tapped sign in")
                    }) {
                        HStack {
                            Text("Sign in")
                                .fontWeight(.bold)
                                .font(.headline)
                        }
                        .frame(maxWidth: 318, maxHeight: 23)
                        .padding()
                        .foregroundColor(Color.white)
                        .background(Color("crx_green").clipShape(RoundedRectangle(cornerRadius: 15)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 1)
                        )
                    }.offset(y: 0)
                }.offset(y: -50)
                
            }.offset(y: -50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FirstScreen()
            SigninScreen()
        }
    }
}
